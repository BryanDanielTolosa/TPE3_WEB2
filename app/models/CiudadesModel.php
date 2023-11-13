<?php



class ModeloCiudad {
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;dbname=agencia_de_viajes;charset=utf8', 'root', '');
    }

    //ObtenerCiudades()
    function GetCiudades()
    {
        $query = $this->db->prepare('SELECT * FROM ciudad');
        $query->execute();
        $ciudades = $query->fetchAll(PDO::FETCH_OBJ);

        return $ciudades;
    }
    function getCiudad($id){
        $sentencia = $this->db->prepare('SELECT * FROM ciudad WHERE id_ciudad = ?');
        $sentencia->execute([$id]);
        $ciudad = $sentencia->fetch(PDO::FETCH_OBJ);
        return $ciudad;
    }

    function editarCiudad($id_ciudad,$ciudad,$pais){
        $querry=$this->db->prepare('UPDATE ciudad SET ciudad = ?, pais = ? WHERE id_ciudad = ?');
        /* UPDATE ciudad SET ciudad = ?, pais = ? WHERE id_ciudad = ?; */
        $querry->execute([$ciudad,$pais,$id_ciudad]);
    }
}

/* {
    "id_ciudad": "4",
    "ciudad": "Itajaí",
    "pais": "Brasil"
} */