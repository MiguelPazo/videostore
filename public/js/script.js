$(document).ready(function(){
    var idCliente = 1 ;
    
    $('.tableListContent tr').click(function(){
        $(this).parent().find('tr').removeClass('selected');
        
        if($(this).hasClass('selected'))               
            $(this).removeClass('selected');
        else
            $(this).addClass('selected');
        
        idCliente = $(this).find('input').val();
    });
    
    $('#buttonEditClient').click(function(){
        $('#idClient').val(idCliente);
        document.clientToEdit.submit();
    });
    
    $('#buttonDeletetClient').click(function(){
        $('#idClientDelete').val(idCliente);
        document.clientToDelete.submit();
    });
});