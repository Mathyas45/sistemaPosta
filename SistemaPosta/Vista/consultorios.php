<section class="content-header">
    <div class="container-fluid">
        <div class="card card-success">
            <div class="card-header">
                <h3 class="card-title">Listado de Consultorios</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre</span>
                            </div>
                            <!-- Con el evento onkeyup puedes realizar la busquedad cada vez que escriba una letra onkeyup="verListado()" -->
                            <input type="text" class="form-control" name="txtBusquedaNombre" id="txtBusquedaNombre" onkeyup="if(event.keyCode=='13'){ verListado(); }">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Estado</span>
                            </div>
                            <select class="form-control" name="cboBusquedadEstado" id="cboBusquedadEstado" onchange="verListado()">
                                <option value="">- Todos -</option>
                                <option value="1">Activos</option>
                                <option value="0">Anulados</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button type="button" class="btn btn-primary" onclick="verListado()"><i class="fa fa-search"></i> Buscar</button>
                        <button type="button" class="btn btn-success" onclick="abrirModalConsultorios()"><i class="fa fa-plus"></i> Nuevo</button>
                        <button type="button" class="btn btn-success" id="btnNuevoEvento"><i class="fa fa-plus"></i> Nuevo</button>

<script>
  document.getElementById("btnNuevoEvento").addEventListener("click", function() {
    window.location.href = "http://localhost/semana/sispuntoventa/sispuntoventa/calendar/index2.php";
  });
</script>
                    </div>
                </div>
            </div>
        </div>
        <div class="card card-success">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12" id="divListadoConsultorios">

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="modalConsultorios"> <!--Modal para crear nueva consultorios-->
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-success">
                <h4 class="modal-title">Consultorios</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="formConsultorios" id="formConsultorios">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Consultorios">
                                <input type="hidden" name="idconsultorios" id="idconsultorios" value="">
                            </div>
                            <div class="form-group" style="display:none">
                                <label for="estado">Estado</label>
                                <select name="estado" id="estado" class="form-control">
                                    <option value="1">ACTIVO</option>
                                    <option value="0">ANULADO</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="guardarConsultorios()"><i class="fa fa-save"></i> Registrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script>
    function verListado() {
        $.ajax({
                method: "POST",
                url: "vista/consultorios_listado.php",
                data: {
                    nombre: $('#txtBusquedaNombre').val(),
                    estado: $('#cboBusquedadEstado').val()
                }
            })
            .done(function(resultado) {
                $('#divListadoConsultorios').html(resultado);
            })
    }

    verListado();

    function guardarConsultorios() {
        if (validarFormulario()) {
            var datos = $('#formConsultorios').serializeArray(); //Serialice todos los campos- convierte todos los campos del form en array
            var idconsultorios = $('#idconsultorios').val();
            if (idconsultorios != "" && idconsultorios != "0") {
                datos.push({
                    name: "accion",
                    value: "ACTUALIZAR"
                });
            } else {
                datos.push({
                    name: "accion",
                    value: "NUEVO"
                });
            }

            $.ajax({
                    method: "POST",
                    url: "controlador/contConsultorios.php",
                    data: datos,
                    dataType: 'json',
                })
                .done(function(resultado) {
                    if (resultado.correcto == 1) {
                        toastCorrecto(resultado.mensaje); //jalado desde principanl llamado toast, donde se configura sus propiedades
                        $('#modalConsultorios').modal('hide');
                        $('#formConsultorios').trigger('reset'); //Para que se limpie 
                        verListado()
                    } else {
                        toastError(resultado.mensaje);
                    }
                });
        }
    }

    function validarFormulario() {
        let correcto = true;
        let nombre = $('#nombre').val();
        if (nombre == "") {
            toastError("Ingresa el nombre de la consultorios");
            correcto = false;
        }
        return correcto;

    }

    function abrirModalConsultorios() {
        $('#formConsultorios').trigger('reset'); //Para que se limpie el modal al abrir el modal
        $('#idconsultorios').val("");
        $('#modalConsultorios').modal('show');
    }
</script>