<?php

class Accounts extends MY_Controller {
 
    function __construct() {
        parent::__construct();
    }
     
    function index() {
    	if ($this->session->userdata('loggedin') != true ) {
    			header('Location: /ib/main/login');
       	} else {
       		$this->load->model('accounts_model', '', true);
    		$this->data['results'] = $this->accounts_model->account_list( ($this->userid) );
    		$this->data['content'] = $this->load->view('partials/accounts.template.php',$this->data , true);
	  	    $this->data['sidebar'] = $this->load->view('partials/sidebar.template.php','', true); 
	     	$this->render();
    	}
    }
    
}
//<!-- (c) Copyright 2009, CommunityBanker.org -->
