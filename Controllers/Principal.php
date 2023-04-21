<?php
class Principal extends Controller
{
    public function __construct() {
        parent::__construct();
        session_start();
    }
    public function index()
    {
        
    }
    //vista about
    public function about()
    {
        $data['title'] = 'Nuestro Equipo';
        $this->views->getView('principal', "about", $data);
    }
    //vista shop
    public function shop()
    {
        $data['title'] = 'Nuestra Tienda';
        $this->views->getView('principal', "shop", $data);
    }
    //vista shop-single
    public function details($id_producto)
    {
        $data['title'] = '------------';
        $this->views->getView('principal', "shop-single", $data);
    }
     //vista contactos
     public function contactos()
     {
         $data['title'] = 'Contactos';
         $this->views->getView('principal', "contact", $data);
     }
}