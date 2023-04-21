<?php
class HomeModel extends Query{
 
    public function __construct()
    {
        parent::__construct();
    }
    public function getCategorias()
    {
        $sql="SELECT * FROM categorias";
        return $this->selectAll($sql);
    }

    public function getProductos()
    {
        $sql="SELECT * FROM productos ORDER BY id DESC limit 6";
        return $this->selectAll($sql);
    }

}
 
?>