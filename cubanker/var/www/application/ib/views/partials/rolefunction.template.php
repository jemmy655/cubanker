<h2>Maintain Role Functions</h2>

<select class="input" name="area" id="area"> 
<?PHP
//print "<option \"{$selected}\" value=\"\">Place holder</option>";
foreach ($results->result() as $row) {
    if ($row->name == "Internet Banking") {
    	$selected="selected";}
     else {
	    $selected = "";
    }
    
    print("<option value=\"{$row->id}\" selected =\"{$selected}\">{$row->name}</option>");
   
}
?>
</select>   
<!-- (c) Copyright 2009, CommunityBanker.org -->
