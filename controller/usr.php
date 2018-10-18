<?php
function choix (){
	if (isset($_SESSION['profil']) ) {
		header("Location:./index.php?controle=dashboard&action=load");
	}
	require("./view/usr/choix.tpl");
}
function connect_etu(){
	connect_any("etu");
}
function connect_prof(){
	connect_any("prof");
}
function connect_any($type){
$login= isset($_POST['login'])?($_POST['login']):''; //ident.tpl a une url parametre
$pwd= isset($_POST['pwd'])?($_POST['pwd']):'';
$msg='';
if (isset($_SESSION['profil']) ) {
		header("Location:./index.php?controle=dashboard&action=load");
}
if($type == "etu")
	$nom_type = "etudiant";
if($type == "prof")
	$nom_type = "professeur";
if  ((!isset($_POST['login']) && !isset($_POST['pwd'] ))){
	require('./view/usr/connect_usr.tpl');
}
else{
		$profil = array(); //profil affecte par l'appel à verif_ident
		require('./model/connect_usrBD.php');
		if  (!check_profile($login,$pwd,$profil,$type)) {
			$msg ="erreur de saisie.";
			require('./view/usr/connect_usr.tpl');
		}
		else  {
			$_SESSION['profil']= $profil; //variable session 'profil' pour l'utilisateur connecte
			$_SESSION['type'] = $type;
			connectBD($_SESSION['profil']);
			$msg = "Connexion reussie.";
			header("Location:./index.php?controle=dashboard&action=load");
		}
	}
}
function disconnect(){
	require('./model/connect_usrBD.php');
	disconnectBD($_SESSION['profil']);
		echo "test";
	session_destroy();
	header("Location:./index.php");
}

function uploadFile(){
	if($_FILES["fileToUpload"]['tmp_name'] == ""){
		header("Location:./index.php?controle=info_usr&action=load");
	}
	$temp = explode(".", $_FILES["fileToUpload"]["name"]);
	$target_dir = "./userdata/images/";
	$target_file = $target_dir . $_SESSION['profil']['nom']. $_SESSION['profil']['prenom'].'.' . end($temp);
	$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
	$uploadOk = 1;
	// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
	    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
	    if($check !== false) {
	        $uploadOk = 1;
	    } else {
	        $uploadOk = 0;
	        $m = "Le fichier n'est pas une image";
	    }
	  }
	if ($_FILES["fileToUpload"]["size"] > 500000) {
    $m = utf8_encode("Votre image est trop large.");
    $uploadOk = 0;
	}


	if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
    $m = utf8_encode("Seulement les jpg, png ou jpeg sont autorises.");
    $uploadOk = 0;
	}
	else {
	    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
	        $m = utf8_encode("Le fichier ". basename( $_FILES["fileToUpload"]["name"]). " a ete envoye.");
	        require("./model/connect_usrBD.php");
	        changeImage($target_file);
	        $_SESSION['profil']['urlPhoto'] = $target_file;
	        $uploadOk = 1;	
	    }
	    else {
	        $m = utf8_encode("Votre fichier n'a pas ete emit.");
	        $uploadOk = 0;
	    }
	}
	if($uploadOk == 0)
		$msg= "<div class='alert alert-danger mt-3 col-sm-6' role='alert'>".$m."</div>";
	else
		$msg= "<div class='alert alert-success mt-3 col-sm-6' role='alert'>".$m."</div>";
	require("./view/dashboard/info_usr.tpl");
}