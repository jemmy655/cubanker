<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
 /* ---------------------------------------------------------------------------
 * The licence goes here... 
 * ---------------------------------------------------------------------------- 
*/
class auth_model extends Model {
	
	public function __construct() {
		parent::__construct();
	}
	
	public function getprofilefunctions($profile_id, $profileaccess) {
		$sql = "SELECT DISTINCT f.display_name, f.uri, r.allowdelete, r.allownew, r.allowedit ";
		$sql = $sql . "FROM rolefunction r JOIN function f  ON f.id = r.functionid JOIN profilerole pr ON pr.roleid = r.roleid ";
		$sql = $sql . "WHERE pr.profileid = '".$profile_id."' and pr.accesstype = '".$profileaccess."'";
		
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {return FALSE;}
		
	}
	
	public function description2access ($description) {
		//which systems does this user's profile have access to?
	    $sql = "SELECT a.accesstype FROM accesstype a ";
		$sql = $sql . "WHERE a.description = '". $description. "' LIMIT 1";
		
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) { 
			$row = $query->first_row();
			return $row->accesstype;       
		} else {return FALSE;}
	}
	
	
	public function access2description($accesstype) {
		//which systems does this user's profile have access to?
	    $sql = "SELECT a.description FROM accesstype a ";
		$sql = $sql . "WHERE a.accesstype = '". $accesstype. "' LIMIT 1";
		
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) { 
			$row = $query->first_row();
			return $row->description;       
		} else {return FALSE;}
	}
	
	public function getaccesslistcount($profileid) {
	    $sql = "SELECT COUNT( a.description) as cnt FROM profileaccess p, accesstype a ";
		$sql = $sql . "WHERE p.accesstype = a.accesstype AND p.profileid = '". $profileid. "'";
		$result = "";
		$query = $this->db->query($sql);
		$row = $query->first_row();
		return $row->cnt ;
	}
	
	
	public function getaccesslist($profileid) {
		//which systems does this user's profile have access to?
	    $sql = "SELECT DISTINCT a.description FROM profileaccess p, accesstype a ";
		$sql = $sql . "WHERE p.accesstype = a.accesstype AND p.profileid = '". $profileid. "'";
		$result = "";
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) { 
	    	return $query->results();
		} else {return FALSE;}
	}
	
	public function profileaccess($profileid) {
		//which systems does this user's profile have access to?
	    $sql = "SELECT p.accesstype , a.description FROM profileaccess p, accesstype a ";
		$sql = $sql . "WHERE p.accesstype = a.accesstype AND p.profileid = '". $profileid. "'";
		
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) { 
	        return $query->result(); //set of sub-systems to access
		} else {return FALSE;}
	}
	
	public function check_password($userid, $password) {
     	// if userid & password match db return true
		$sql = "Select p.entityid, p.passwordexpireson, p.id from profile p where ";
		$sql = $sql . "p.userid='" . $userid . "' and p.passwordhash='" .$password . "'";
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) {
            $row = $query->first_row();
			return $row->id;
		} else {return FALSE;}	
	}
	
}
/* (c)Copyright 2009-2011, CommunityBanker.org */
