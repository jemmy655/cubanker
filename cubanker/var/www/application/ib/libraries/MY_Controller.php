<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
 
class MY_Controller extends Controller {
 
	public $data = array();
    	protected $controller_name;
    	protected $action_name;
    	protected $userid;
    	protected $pw;
 
	public function __construct() {
		parent::Controller();
		//prepare the template 
		$this->add_css('main');
		$this->load_defaults();
	}
	
    	protected function load_defaults() {
    		$this->data['userid'] = $this->session->userdata('userid');
	        $this->data['heading'] = 'Internet Banking';
        	$this->data['title'] = 'CommunityBanker Internet Banking&trade';
        	$this->data['login'] = $this->load->view('partials/login.template.php','',true);
        	$this->data['headingnav'] = $this->load->view('partials/logged-out-nav.template.php','',true); 
        	$this->data['menu'] =  '';
        	$this->data['content'] = $this->load->view('partials/content.template.php','', true);
        	$this->data['sidebar'] = $this->load->view('partials/sidebar.template.php','', true);
		$this->data['timeout'] = 0; // client side timeout in seconds - 0=no timeout for login page!
		
       		$this->controller_name = $this->router->fetch_directory() . $this->router->fetch_class();
	        $this->action_name = $this->router->fetch_method();
     	}
 
    	protected function render($template = 'main' ) {
    		if ($this->session->userdata('loggedin') == true ) {
    			$this->data['headingnav'] = $this->load->view('partials/logged-in-nav.template.php','',true);
    			$this->data['menu'] =  $this->load->view('partials/menu.template.php','', true);
			$this->data['timeout'] = 60; //client side timeout in seconds
    			$this->data['login'] = '';		
     		}
		//prevent the bowser BACK button working	
		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate, no-transform, max-age=0, post-check=0, pre-check=0");
		$this->output->set_header("Pragma: no-cache");

		$this->load->view("layouts/$template.template.php", $this->data );
    	}
 
	protected function add_css($filename) {
		$this->data['css'] = $this->load->view("partials/css.template.php", array('filename' => $filename), true);
    	}
}
/* (c)Copyright 2009-2011, CommunityBanker.org */
/* End of file MY_Controller.php */
