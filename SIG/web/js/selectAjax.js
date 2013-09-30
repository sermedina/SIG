    function trim(s) 
    {
        return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }

    function validate()
    {
        if(trim(document.frmLogin.userName.value) === "")
        {
          alert("Campo Usuario vacio");
          document.frmLogin.userName.focus();
          return false;
        }
        else if(trim(document.frmLogin.password.value) === "")
        {
          alert("Campo Password vacio");
          document.frmLogin.password.focus();
          return false;
        }
        return true;
    }
    
    function confirmacion () {
        try {
            var c = confirm("¿Esta seguro de que desea eliminar?");
            return c;
        }
        catch (e) {
            alert("Se produjo un error, intente de nuevo por favor");
        }
    }

    $(document).ready(function(){    
    $("#msjOut").fadeIn(2000).delay(500).fadeOut(5000);
           $("#selectIns").change(function(){
               var uni = $("#selectIns").find(':selected').val();
               $('#selectCar')[0].options.length = 0;
                        $.ajax({
                        type: "POST",
                        url: "cargarCarreras?uni="+uni,
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',                       
                        success: function(json){
  
                  $.each(json, function(i, value) {
                      
                       $.each(value, function(j, index) {
                    
                            $('#selectCar').append($('<option>').text(j).attr("value",index));
                                      
        });
                
        });
                    
                  }
                });
           });
        });
        
        
       