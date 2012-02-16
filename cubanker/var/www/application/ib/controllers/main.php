<?php

class Main extends MY_Controller {
/* ----------------------------------------------------------------------------|
|										|
| Main is the main Internet Banking Controller. It relies on MY_Controller to  | 
| build it's views in a consistent manor.					| 	
|						(c) Andrew Turpin, Oct 2010	|
|-----------------------------------------------------------------------------*/

	function __construct() { parent::__construct(); }

	function _loggedin_ok() {
		$oki = $this->session->userdata('loggedin');
		return $oki;
	}

	function index() {
		$this->projectitems();
	}

	function __reset_cookies($loggedin) {
		//Set session data
		$this->session->sess_destroy();
		$session_data = array( 'loggedin' => $loggedin,
					'sessionid' => 'unused' );
		$this->session->set_userdata($session_data);
	}

	function login() {
		//the order of these are important
		$this->load_defaults();    		
		$this->__reset_cookies(false);
        	$this->render();
	}
	
	 function authenticate() 
	{
        	$this->load->model('auth_model', '', TRUE);
      		
		$this->userid = $this->input->post('userid');
		$this->pw = $this->input->post('password');	
		

      		if ($this->auth_model->check_password($this->userid, $this->pw )) {
                
	                //Set session data
			$this->__reset_cookies(true);
                
     	        	//add userid to data array 
     	        	$this->data['userid'] = $this->userid;
                	
		        header('Location: /ib/main', true);

       		} else { header('Location: /ib/main/login', true); }	 
	}
	
	function accounts() {
	// ==================================================
	// This function lists the valid accounts linked to the 
	// members Internet banking Profile
	//
	// ==================================================
		if (!$this->_loggedin_ok() ) {
    			header('Location: /ib/main/login');
	       	} else {
	       		$this->load->model('accounts_model', '', true);
			$this->userid = $this->data['userid'];
	       		
    			$this->data['results'] = $this->accounts_model->account_list( $this->userid ); 
		      	$this->data['content'] = $this->load->view('partials/accounts.template.php',$this->data , true);
        		$this->data['sidebar'] = $this->load->view('partials/sidebar.template.php','', true);
        		
 			//optional way of presenting table data       		
        		//$this->load->library('table');
			//$this->data['content'] = $this->table->generate($this->accounts_model->account_list( $this->userid ));
			$this->render();
        	}
	}
	
	function projectitems() {
		if  (!$this->_loggedin_ok()) { 
			$this->login();
		} else { //loggedin_ok
			$this->load->model('login_model', '', TRUE);
			$this->data['results'] = $this->login_model->getprojectitems() ;
			$this->data['content'] = $this->load->view('partials/projectitems.template.php',$this->data , true);
			$this->render();
		}
	}

	function products() 
	{
		$this->data['content'] = $this->load->view('static/products.php','',true);
        	$this->data['sidebar'] = $this->load->view('static/products-sidebar.php','',true);   
        	$this->render();
	}
	function disclaimer() 
	{
		$this->data['content'] = $this->load->view('static/disclaimer.php','',true);
        	$this->data['sidebar'] = ""; //$this->load->view('static/products-sidebar.php','',true);   
        	$this->render();
	}	
}

/* End of file main.php */
/* Location: ./application/ib.main.php */

