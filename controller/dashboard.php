<?php

function load(){
	if (isset($_SESSION['profil'])){
		$_POST['menu'] = ('menu_'.$_SESSION['type']) ();
		$edth = 0;

		require("./view/dashboard/dashboard.tpl");
	}else
		header("Location:./index.php");
}

function menu_etu(){
	return 'test';
}

function edth_etu(){

}

function menu_prof(){
	return 'test';
}