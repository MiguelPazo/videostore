<?php

class Application_Model_Cliente extends Zend_Db_Table_Abstract
{
    protected $_name = 'cliente';
    
    public $_idCliente;
    public $_nombre;
    public $_apellidos;
    public $_codigo;
    public $_fechaVigencia;
    
    public function save() {
        $db = $this->getAdapter();
        
        $queryNewClient = $db->query("CALL newClient(
                '{$this->_nombre}',
                '{$this->_apellidos}',
                '{$this->_codigo}',
                '{$this->_fechaVigencia}')");                
    }
    
    public function listAll() {
        $db = $this->getAdapter();
        $querySearchAllClient = $db->query("CALL searchAllClient()");
        return $querySearchAllClient->fetchAll();    
    }
    
    public function searchClient() {
        $db = $this->getAdapter();
        $querySearchClient = $db->query("CALL searchClient(
                '{$this->_idCliente}')");
        return $querySearchClient->fetch();        
    }
    
    public function saveEditClient() {
        $db = $this->getAdapter();
        $querySaveEditClient = $db->query("CALL saveEditClient(
                '{$this->_idCliente}',
                '{$this->_nombre}',
                '{$this->_apellidos}',
                '{$this->_codigo}',
                '{$this->_fechaVigencia}')");
    }
    
    public function deleteClient() {
        $db = $this->getAdapter();
        $queryDeleteClient = $db->query("CALL deleteClient(
            '{$this->_idCliente}')");    
    }
}