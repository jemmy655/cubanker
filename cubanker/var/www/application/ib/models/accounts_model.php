<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
 /* ---------------------------------------------------------------------------
 * The licence goes here... 
 * ---------------------------------------------------------------------------- 
 */
 
class accounts_model extends Model {
	
	public function __construct() {
		parent::__construct();
	}
	
	public function account_list($userid) {
     // SELECT from account where the account is in the profile that is selected...

		$result = $this->db->query("select sortcode as Account_Name, number as Account_Number from account");
 		return $result;
	}
	
}

