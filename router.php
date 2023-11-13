<?php
    require_once 'config.php';
    require_once 'libs/router.php';

    require_once 'app/controllers/CiudadesController.php';

    $router = new Router();

    #                 endpoint      verbo     controller           método
    $router->addRoute('ciudades','GET','CiudadesController','getCiudades');
    $router->addRoute('ciudades/:ID','GET','CiudadesController','getCiudad'); 
    $router->addRoute('ciudades/', 'POST' , 'CiudadesController' , 'InsertarCiudad');
    $router->addRoute('ciudades/:ID', 'PUT' , 'CiudadesController' , 'editarCiudad');

  
    
    #del htaccess resource=(), verbo con el que llamo GET/POST/PUT/etc
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
    ?>