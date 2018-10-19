<?php

function user_select()
{
	if(isset($SESSION['profile']))
		header("Location=./index?controle=".$SESSION['type']."&action=connect");
	require('./view/connection/user_select.tpl');
}