<?php
require_once 'app/models/CiudadesModel.php';
require_once 'app/views/api.view.php';

class CiudadesController
{
    private $model;
    private $view;
    private $data;

    function __construct()
    {
        $this->model = new ModeloCiudad();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input");
    }

    private function getData()
    {
        return json_decode($this->data);
    }

    function getCiudades($params = [])
    {
        $ciudades = $this->model->GetCiudades();
        $this->view->response($ciudades, 200);
    }

    function getCiudad($params = [])
    {
        $ciudad = $this->model->getCiudad($params[":ID"]);
        if (!isset($ciudad)) {
            $this->view->response("La ciudad con el id=" . $params[':ID'] . " no existe", 404);
        } else {
            $this->view->response($ciudad, 200);
        }
    }

    function editarCiudad($params = null)
    {
        $id = $params[':ID'];
        $CiudadQueVoyAEditar = $this->model->getCiudad($id);
        if (isset($CiudadQueVoyAEditar)) {
            $datosDelForm = $this->getData();

            $CiudadEditada = $this->model->editarCiudad($datosDelForm->id_ciudad, $datosDelForm->ciudad, $datosDelForm->pais);
            $CiudadEditada = $this->model->getCiudad($id);
            $this->view->response($CiudadEditada, 200);
        } else {
            $this->view->response("No puede dejar estos campos sin completar", 400);
        }
    }
}
