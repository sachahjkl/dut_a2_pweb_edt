<form action="index.php?controle=chat&action=chargerMessage" method="post">
  <select name="id_dest">
  	<?php
  	foreach ($etu_connected as $etu){
    	echo utf8_encode("<option value=".$etu["id_etu"].">".$etu['nom']." ".$etu['prenom']."</option>");
	}
    ?>
  </select>
  <br><br>
  <input type="submit">
</form>