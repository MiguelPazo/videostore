<?php

class ClientsController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $client = new Application_Model_Cliente();
        $this->view->allClients = $client->listAll();
    }
    
    public function newAction()
    {
        if($this->_request->isPost()) {
            $client = new Application_Model_Cliente();
            $client->_nombre = $this->_getParam('fisrtName');
            $client->_apellidos = $this->_getParam('lastName');
            $client->_codigo = $this->_getParam('code');
            
            $date = explode('-', $this->_getParam('effectiveDate'));
            $client->_fechaVigencia = $date[2] . '-' . $date[1] . '-' . $date[0];
            
            $client->save();
            
            $this->view->message = 'New client successfully registered';            
        }
    }
    public function editAction()
    {        
        if($this->_request->isPost()) {
            $operation = $this->_getParam('operation');
            $client = new Application_Model_Cliente();
            $client->_idCliente = $this->_getParam('idClient');
            
            if($operation == 'edit') {
                $dataClient = $client->searchClient();
                $this->view->dataClient = $dataClient;
            }
            else {
                $clientEdit = new Application_Model_Cliente();
                $clientEdit->_idCliente = $this->_getParam('idClient');
                $clientEdit->_nombre = $this->_getParam('fisrtName');
                $clientEdit->_apellidos = $this->_getParam('lastName');
                $clientEdit->_codigo = $this->_getParam('code');
                
                $date = explode('-', $this->_getParam('effectiveDate'));
                $clientEdit->_fechaVigencia = $date[2] . '-' . $date[1] . '-' . $date[0];
                
                $clientEdit->saveEditClient();
                $this->view->message = 'Cliente modificado satisfactoriamente';
            }
        }
    }
    
    public function deleteAction()
    {        
        $client = new Application_Model_Cliente();
        $client->_idCliente = $this->_getParam('idClient');
        $client->deleteClient();
        $this->_redirect('/clients');
    }
}