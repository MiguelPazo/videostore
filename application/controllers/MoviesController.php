<?php

class MoviesController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function newAction()
    {
        if($this->_request->isPost()) {
            $movie = new Application_Model_Producto();
            $movie->_t = $this->_getParam('title');
            $movie->_apellidos = $this->_getParam('code');
            $movie->_categoria = $this->_getParam('category');
            $movie->_tipoAudiencia = $this->_getParam('typeAudience');
            $movie->_tipoProducto = $this->_getParam('typeProduct');
            $movie->_diasAlquiler = $this->_getParam('rentalDays');
            $movie->_precio = $this->_getParam('price');
            $movie->_costo = $this->_getParam('cost');
            $movie->_numFactura = $this->_getParam('invoiceNumber');
            
            $date = explode('-', $this->_getParam('datePurchase'));
            $movie->_fechaCompra = $date[2] . '-' . $date[1] . '-' . $date[0];
            
            $movie->_estado = $this->_getParam('status');
            
            
            $movie->save();
            
            $this->view->message = 'New movie successfully registered';            
        }
    }
}