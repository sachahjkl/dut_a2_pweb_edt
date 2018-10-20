<?php

function userSelect()
{
    if (isset($_SESSION['profile'])) {
        header("Location=./index?controle=" . $_SESSION['userType'] . "&action=connect");
    }

    require './view/connection/userSelect.tpl';
}
