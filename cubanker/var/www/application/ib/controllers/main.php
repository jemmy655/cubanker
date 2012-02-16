<?php

class Main extends MY_Controller {
/* -----------------------------------------------------------------------------|
|																				|
| Main is the main Internet Banking Controller. It relies on MY_Controller to	|
| build it's views in a consistent manner.										| 	
|						(c) Andrew Turpin, Oct 2010								|
|------------------------------------------------------------------------------*/

	function __construct() { 
		parent::__construct(); 
		$this->load->model('auth_model', '', TRUE);
	}

	function _loggedin_ok() {
		$oki = $this->session->userdata('loggedin');
		return $oki;
	}

	function index() {
		if  (!$this->_loggedin_ok()) { 
			$this->login();
		} else { //loggedin_ok
						
			//Render specfic page
			$this->load->model('login_model', '', TRUE);
			$this->data['results'] = $this->login_model->getprojectitems() ;
			$this->data['content'] = $this->load->view('partials/projectitems.template.php',$this->data , true);
			$this->render();
		}
	}

	function __reset_cookies($loggedin, $userid, $profile_id)  {
		//Set session data
		if (!$loggedin) { $this->session->sess_destroy(); }
		$session_data = array( 'loggedin'	=> $loggedin,
								'userid' => $userid,
								'profile_id' => $profile_id );
								
		$this->session->set_userdata($session_data);
	}

	function login() {
		//the order of these are important
		$this->load_defaults();    		
		$this->__reset_cookies(FALSE,'',0);
        $this->render();
	}
	
	function authenticate() {
        $this->load->model('auth_model', '', TRUE);
      		
		$this->userid = $this->input->post('userid');
		$this->pw = $this->input->post('password');	
		 
   		if ($this->profile_id  = $this->auth_model->check_password($this->userid, $this->pw)) {
   			//Get persistent values from last login
   			//.... not yet implemented .....
   			      
			$this->__reset_cookies(TRUE, $this->userid , $this->profile_id);
        	
	        header('Location: /ib/main', true);

       	} else { header('Location: /ib/main/login', true); }	 
	}

	function products() {
		$this->data['content'] = $this->load->view('static/products.php','',true);
       	$this->data['sidebar'] = $this->load->view('static/products-sidebar.php','',true);   
       	$this->render();
	}
	
	function disclaimer() {
		$this->data['content'] = $this->load->view('static/disclaimer.php','',true);
       	$this->data['sidebar'] = ""; //$this->load->view('static/products-sidebar.php','',true);   
       	$this->render();
	}	
}
