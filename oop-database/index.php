<?php

require_once __DIR__.'/vendor/autoload.php';

use OOP\App\TrxHeaderController;
$controller = new TrxHeaderController;  

switch (@$_GET['page']) {
    case 'show':
        $controller->show($_GET['id']);
        break;

    case 'edit':
        $controller->update($_GET['id']);
        break;
    
    case 'add':
        $controller->add();
        break;
    case 'delete':
        $controller->delete($_GET['id']);
        break;
    default:
        $controller->index();
        break;
}