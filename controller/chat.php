<?php
header('content-type: text/html; charset=utf-8');
function chargerMessage()
{
    $_SESSION['id_dest'] = $_POST['id_dest'];
    require "./model/Chat_etu.php";
    $id_src = $_SESSION["profile"]['id_etu'];
    $id_dest = $_SESSION['id_dest'];
    var_dump($id_dest);
    $messagesEchanges = recupererMessages($id_src, $id_dest);
    require "./view/chat/chat_etu.tpl";
}

function envoyerMessage()
{
    require "./model/Chat_etu.php";
    //var_dump($_POST);die();
    $id_src = intval($_SESSION["profile"]['id_etu']);
    $id_dest = intval($_SESSION['id_dest']);
    $msg = $_POST['msg'];
    envoyer($id_src, $id_dest, $msg);
    $messagesEchanges = recupererMessages($id_src, $id_dest);
    $_POST = $_SESSION["id_dest"];
    header("Location:./index.php?controle=chat&action=chargerMessage");
}
