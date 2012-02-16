<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
 
class MY_Controller extends Controller {
 
	public $data = array();
	protected $controller_name;
	protected $action_name;
	protected $userid;
	protected $pw;
	protected $profile_id;

	public function __construct() {
		parent::Controller();
		//prepare the template
		$this->load->model('auth_model', '', TRUE);
		
		$this->add_css('main');
		$this->load_defaults();
		$this->load_securemenu();
	}
	
	protected function load_securemenu() {
		//$this->load->model('auth_model', '', TRUE);
		
		//Set Heading to Selected/Default Profile
		if (! ($access = $this->input->post('profile_option')) ) { 
		//	$rs = $this->auth_model->getaccesslist( $this->data['profile_id'] ) ;
			//$this->data['heading'] = 'Internet Banking';  //default until I can figure this out...
			$access = $this->auth_model->description2access('Internet Banking');
		} 
		$this->data['heading'] = $this->auth_model->access2description($access); 
		$this->data['access'] = $this->load_profileaccess( $this->data['profile_id'], $this->data['heading']);
		
		//load the menu in accordance with profile and profile access settings
		$this->data['functions'] = $this->load_profilefunctions( ($this->data['profile_id']), $access);
	}
	
	protected function load_profilefunctions($profile_id, $profileaccess) {
		//$this->load->model('auth_model', '', TRUE);
      	 $html = "";
   		if ( $funct = $this->auth_model->getprofilefunctions($profile_id, $profileaccess) ) {
		  	foreach ($funct as $item) {
				$html = $html . '<li><a href="' .$item->uri. '">'.$item->display_name.'</a> </li><br>';
			}
			return $html;
		} else {return FALSE;}
	}
	
	protected function load_profileaccess($profile_id, $select) {
		//$this->load->model('auth_model', '', TRUE);
      	 
   		if ( ($access = $this->auth_model->profileaccess($profile_id)) && ($this->auth_model->getaccesslistcount($profile_id) > 1 ) ) {
   			$html = '<li><select name="profile_option" onchange="javascript: document.forms[\'profile\'].submit();">'; 
			foreach ($access as $option) {
				//use either 'ib' or heading 'Internet Banking' etc to select option
				if ($select === $option->description || $select === $option->accesstype ) {
					$profile_selected = 'selected';} else {$profile_selected = ''; }
				$html = $html . '<option value="' .$option->accesstype. '"'. $profile_selected. '>'.$option->description.'</option>';
			}
			$html = $html . "</select></li>";	
			return $html;
		} else {return FALSE;}
	}
	
    protected function load_defaults() {
	    $this->load->config('auth');
		$this->auth['timeout'] = $this->config->item('auth');
		$this->data['userid'] = $this->session->userdata('userid');
		$this->data['profile_id'] = $this->session->userdata('profile_id');
		$this->data['heading'] = 'Internet Banking';
		$this->data['title'] = 'CommunityBanker Internet Banking&trade';
		$this->data['login'] = $this->load->view('partials/login.template.php','',true);
		$this->data['headingnav'] = $this->load->view('partials/logged-out-nav.template.php','',true); 
		$this->data['menu'] =  '';
		$this->data['content'] = $this->load->view('partials/content.template.php','', true);
		$this->data['access'] = $this->load_profileaccess( $this->data['profile_id'], $this->data['heading']);
		$this->data['sidebar'] = $this->load->view('partials/sidebar.template.php','',true);
		$this->data['timeout'] = 0; // client side timeout in seconds - 0=no timeout for login page!
		$this->data['functions'] = '';

		$this->controller_name = $this->router->fetch_directory() . $this->router->fetch_class();
		$this->action_name = $this->router->fetch_method();
     }
 
    protected function render($template = 'main' ) {
    	if ($this->session->userdata('loggedin') == true ) {
	    	$this->data['userid'] = $this->session->userdata('userid');
    		$this->data['headingnav'] = $this->load->view('partials/logged-in-nav.template.php','',true);
    		$this->data['menu'] =  $this->load->view('partials/menu.template.php','', true);
			$this->data['timeout'] = 600; //client side timeout in seconds
    		$this->data['login'] = '';		
    	}
		//prevent the bowser BACK button working	
		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, 
									no-transform, max-age=0, post-check=0, pre-check=0");
		$this->output->set_header("Pragma: no-cache");

		$this->load->view("layouts/$template.template.php", $this->data );
    }
 
	protected function add_css($filename) {
		$this->data['css'] = $this->load->view("partials/css.template.php", array('filename' => $filename), true);
    }
}
/* (c)Copyright 2009-2011, CommunityBanker.org */
/* End of file MY_Controller.php */
