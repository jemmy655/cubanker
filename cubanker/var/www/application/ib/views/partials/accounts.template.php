<h2>Accounts for Userid = <?php echo $userid; ?></h2>
<table>
   <?php 
    if(count($results->result())==0)    echo "Sorry no member exists.";
    
     foreach($results->result() as $row){
     	echo "<tr>";
  		echo "<td>".$row->Account_Name."</td><td>". $row->Account_Number."</td>" ;
     	echo "</tr>"; 
     }
    ?>
</table>
<!-- (c) Copyright 2009, CommunityBanker.org -->