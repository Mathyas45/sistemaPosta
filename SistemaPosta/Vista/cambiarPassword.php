<?php
	require_once('../modelo/clsUsuario.php');
?>
<section class="content mt-2">
    <div class="container-fluid">
    	<div class="row">
	    	<div class="col-md-3"></div>
	    	<div class="col-md-6">
		        <div class="card card-primary">
		            <div class="card-header">
		                <h3 class="card-title">CAMBIAR CONTRASEÑA</h3>
		            </div>
		            <div class="card-body">
		                <form id="frmUsuario" name="formUsuario">
		                	<div class="row">
			                    <div class="col-12">
			                        <div class="form-group">
                      					<label for="txtusuario">Usuario</label>
			                            <input type="text" class="form-control" id="txtusuario" readonly name="txtusuario" value="<?= $_SESSION['nombre'] ?>" autocomplete="off"/>
			                        </div>
			                    </div>
			                    <div class="col-12">
			                        <div class="form-group">
                      					<label for="txtpassword">Contraseña Actual</label>
			                            <input type="password" class="form-control" id="txtpassword" name="txtpassword" value="" autocomplete="off"/>
			                        </div>
			                    </div>
			                    <div class="col-12">
			                        <div class="form-group">
                      					<label for="txtnewpassword">Nueva Contraseña</label>
			                            <input type="password" class="form-control" id="txtnewpassword" name="txtnewpassword" value="" autocomplete="off"/>
			                        </div>
			                    </div>
			                    <div class="col-12">
			                        <div class="form-group">
                      					<label for="txtnewpasswordconfir">Confirmar Contraseña</label>
			                            <input type="password" class="form-control" id="txtnewpasswordconfir" name="txtnewpasswordconfir" value="" autocomplete="off"/>
			                        </div>
			                    </div>
			                    <div class="col-12 text-center">
			                    	<button type="button" class="btn btn-success" onclick="actualizarPass()"><i class="fa fa-edit"></i> Actualizar</button>
			                    </div>
			                </div>
		                </form>
		            </div>
		        </div>
		    </div>
    	</div>
    </div>
</section>
<script>
	function actualizarPass(){
		if(validarFormulario()){
		$.ajax({
			method:'POST',
			url: 'controlador/contUsuario.php',
			data: {
					accion: 'CAMBIAR_PASSWORD',
					pass_actual: $('#txtpassword').val(),
					new_pass: $('#txtnewpassword').val(),
					new_pass_confir : $('#txtnewpasswordconfir').val()
			},
			dataType: 'json'
		})
		.done(function(resultado){
			if(resultado.correcto==1){
	          toastCorrecto(resultado.mensaje);
	          $('#formUsuario').trigger('reset');
	        }else{
	          toastError(resultado.mensaje)
	        }
		});
		}
	}

	 function validarFormulario(){
	    let correcto = true;
	    let txtpassword = $('#txtpassword').val();

	    $('.obligatorio').removeClass('is-invalid');

	    if(txtpassword==""){
	      toastError('Ingrese la contraseña actual');
	      $('#txtpassword').addClass('is-invalid');
	      correcto = false;
	    }

	    return correcto;
  	}

</script>