<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
 /* ---------------------------------------------------------------------------
 * The licence goes here... 
 * ---------------------------------------------------------------------------- 
*/
class auth_model extends Model {
	
	public function __construct() {
		parent::__construct();
		$this->load->config('auth');
		$this->auth['timeout'] = $this->config->item('auth');
	}
	
	public function check_password($userid, $password) {
     /* if userid & password match db return true*/
		$sql = "Select p.entityid, p.passwordexpireson from profile p, logintype l where ";
		$sql = $sql . "p.logintype = l.id and l.description = 'Internet Banking' and ";
		$sql = $sql .  "p.userid='" . $userid . "' and p.passwordhash='" .$password . "'";
	
		//$this->db->select('entityid', 'passwordexpireson');
		//$this->db->from('profile','logintype')
		//$this->db->join('logintype', 'profile.logintype = logintype.id');
		//$this->db->where('logintype.description', 'Internet Banking');
		//$this->db->where('profile.userid',$userid);
		//$this->db->where('profile.passwordhash',$password);
		$query = $this->db->query($sql);
		$output = (($query->num_rows() > 0));
		
		return $output;
	}
	
	public function set_db_session($userid, $session=false) {
	 /* if $session=false then set_db_session=NUL for userid */
	}
}
	

