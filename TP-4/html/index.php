<?php
	echo "OK !";

	try {
		$connexion = new PDO('mysql:host=mariadb','root','secret');
		$req = "SELECT * FROM stage.t1";
		$sth = $connexion->prepare($req);
		$sth->execute();

    		print("<ul>\n");
    		while ($ligne = $sth->fetch(PDO::FETCH_ASSOC)) {
      		print("<li>$ligne[id]</li>\n");
    		}
    		print("</ul>\n");
	
	} catch (Exception $e) {
		
	die($e->getMessage());
  	}
?>


