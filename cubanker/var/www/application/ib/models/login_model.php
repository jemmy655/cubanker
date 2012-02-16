<?php
class Login_model extends Model {

	function Login_model()
	{
		parent::Model();
	}

		
	function getProjectItems()
	{
		//this function returns the project items that have been manually entered into the project table
		$query = $this->db->get('project');
		return $query;
	}


}

