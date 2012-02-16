<?php
//this class provides the Role-Function Security implementation COntroller 
//under construction ///
class Security extends MY_Controller {
 
    function __construct() {
        parent::__construct();
    }
     
    function index() {
    /* Default login page */
    		if ($this->session->userdata('loggedin') != true ) {
    			header('Location: /ib/main/login');
       	} else {
       		$this->load->model('security_model', '', true);
       		
       		$this->data['role']="Admin";
       		
    			$this->data['results'] = $this->security_model->role_list(); 
	      	$this->data['content'] = $this->load->view('partials/rolefunction.template.php',$this->data , true);
        		$this->data['sidebar'] = $this->load->view('partials/sidebar.template.php','', true);
        		
      	  	$this->render();
        	}
    }
}
?>
