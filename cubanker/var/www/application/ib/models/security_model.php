<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
 /* ---------------------------------------------------------------------------
 * The licence goes here... 
 * ---------------------------------------------------------------------------- 
 */
 
class security_model extends Model {
	
	public function __construct() {
		parent::__construct();
	}
	
	public function role_list() {
  		//retrieve all the roles...
		$query = "SELECT * FROM role ";		
		$result = $this->db->query($query);
 		return $result;
	}
	
}
	
?>