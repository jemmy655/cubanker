<h2>Programmer Project Items </h2>

<table id ="clearview-table">
	<thead>
	 	<tr>
	  	<th scope="col">Id</th>
	      <th scope="col">Project Item</th>
	      <th scope="col">Notes</th>
	  </tr>
	 </thead>
	<tbody>
	<?php 
	 if(count($results->result())==0)    echo "Sorry no project items exists.";
	  foreach($results->result() as $row){
	  	echo "<tr>";
	  	echo "<td>" .$row->id."</td>";
	  		echo "<td>".$row->item ."</td><td>". $row->notes ."</td>" ;
	  	echo "</tr>"; 
	  }
	?>
	</tbody>
   <!-- Table footer -->  
   <tfoot>  
       <tr>  
            <td colspan="3">**note: this is nothing more than an aid to developers of CummintyBanker as to what is highest on teh development agenda.</td>  
       </tr>  
  </tfoot>  

</table>
<br>

   
<!-- (c) Copyright 2009, CommunityBanker.org -->