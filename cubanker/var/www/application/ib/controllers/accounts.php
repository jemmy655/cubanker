<?php

class Accounts extends MY_Controller {
 
    function __construct() {
        parent::__construct();
    }
     
    function index() {
    /* Default login page */
    		if ($this->session->userdata('loggedin') != true ) {
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
}
?>
