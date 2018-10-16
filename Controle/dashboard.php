<?php

function load(){
	if (isset($_SESSION['profil']))
		require("./Vue/dashboard/dashboard.tpl");
	else
		header("Location:./index.php");
}