<?php

function login()
{
	$type = 'professeur';
	echo $type;
	$util = "professeur";
	$login = "";
	$msg='';
	require('./view/connection/connect_usr.tpl');	
}

function connect(){
	if(isset($SESSION['profile']))
		require("./view/dashboard/dashboard.tpl");
	$login= isset($_POST['login'])?($_POST['login']):''; //ident.tpl a une url parametre
	$pwd= isset($_POST['pwd'])?($_POST['pwd']):'';
	$msg='';

}