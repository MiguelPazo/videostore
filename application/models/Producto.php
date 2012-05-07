<?php

class Application_Model_Producto extends App_Db_Table
{
    protected $_name = 'producto';
    
    public $_idTienda = '';
    public $_titulo;
    public $_codigo;
    public $_categoria;
    public $_tipoAudiencia;
    public $_tipoProducto;
    public $_diasAlquiler;
    public $_precio;
    public $_costo;
    public $_numFactura;
    public $_fechaCompra;
    public $_estado;
    
    public function save() {
        $db = $this->getAdapter();
        
        $stmt = $db->query("CALL newClient(
                '{$this->_idTienda}',
                '{$this->_titulo}',
                '{$this->_codigo}',
                '{$this->_categoria}',
                '{$this->_tipoAudiencia}',
                '{$this->_tipoProducto}',
                '{$this->_diasAlquiler}',
                '{$this->_precio}',
                '{$this->_costo}',
                '{$this->_numFactura}',
                '{$this->_fechaCompra}',
                '{$this->_estado}')");
    }
    
    public function listAll() {
        return $this->fetchAll();
    }
}