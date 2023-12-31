<?php
	require_once('../modelo/clsProducto.php');

	$objPro = new clsProducto();

	$nombre = $_POST['nombre'];
	$estado = $_POST['estado'];
	$idcategoria = $_POST['idcategoria'];
	$codigo = $_POST['codigo'];

	$listaProducto = $objPro->listarProducto($codigo, $nombre, $idcategoria, $estado);
	$listaProducto = $listaProducto->fetchAll(PDO::FETCH_NAMED);


?>
<table id="tableProducto" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>COD</th>
			<th>IMAGEN</th>
			<th>CODIGO</th>
			<th>PRODUCTO</th>
			<th>UNIDAD</th>
			<th>P.VENTA</th>
			<!-- <th>P.COMPRA</th> -->
			<th>ESTADO</th>
			<th>OPCIONES</th>
			<!-- <th>ANU</th>
			<th>ELI</th> -->
		</tr>
	</thead>
	<tbody>
		<?php foreach ($listaProducto as $key => $value) { 
			$class = "";
			$tdclass = "";
			if($value['estado']==0){
				$class = "text-red";
				$tdclass = "bg-danger";
			}
		?>
		<tr class="<?= $class ?>">
			<td><?= $value['idproducto'] ?></td>
			<td>
				<a href="<?= $value['urlimagen'] ?>" target="_blank">
				<img src="<?= $value['urlimagen'] ?>" style="width: 40px; height: 40px;">
				</a>
			</td>
			<td><?= $value['codigobarra'] ?></td>
			<td><?= $value['nombre'] ?></td>
			<td><?= $value['unidad'] ?></td>
			<td><?= $value['pventa'] ?></td>
			<!-- <td><?= $value['pcompra'] ?></td> -->
			<td class="<?= $tdclass; ?>">
				<?php
					if($value['estado']==1){
						echo "Activo";
					}else{
						echo "Anulado";
					}
				?>		
			</td>
			<td>
				<!-- <button type="button" class="btn btn-info btn-sm" onclick="editarProducto(<?= $value['idproducto'] ?>)"><i class="fa fa-edit"></i> Edi</button> -->
				<div class="btn-group">
                    <button type="button" class="btn btn-info btn-flat btn-sm">Opciones</button>
                    <button type="button" class="btn btn-info btn-flat dropdown-toggle dropdown-icon btn-sm" data-toggle="dropdown">
                    	<span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu" role="menu">
                    	<a class="dropdown-item" href="#" onclick="subirImagen(<?= $value['idproducto'] ?>)"><i class="fa fa-upload"></i> Subir Imagen</a>
                    	<a class="dropdown-item" href="#" onclick="editarProducto(<?= $value['idproducto'] ?>)"><i class="fa fa-edit"></i> Editar</a>
                    	<?php if($value['estado']==1){ ?>
                    	<a class="dropdown-item" href="#" onclick="cambiarEstadoProducto(<?= $value['idproducto'] ?>,0)"><i class="fa fa-trash"></i> Anular</a>
                    	<?php }else{ ?>
                    	<a class="dropdown-item" href="#" onclick="cambiarEstadoProducto(<?= $value['idproducto'] ?>,1)"><i class="fa fa-check"></i> Activar</a>
                    	<?php } ?>
                    	<a class="dropdown-item" href="#" onclick="cambiarEstadoProducto(<?= $value['idproducto'] ?>,2)"><i class="fa fa-times"></i> Eliminar</a>
                    </div>
                </div>
			</td>
			<!-- <td>
				<?php if($value['estado']==1){ ?>
				<button type="button" class="btn btn-warning btn-sm" onclick="cambiarEstadoProducto(<?= $value['idproducto'] ?>,0)"><i class="fa fa-trash"></i> Anu</button>
				<?php }else{ ?>
				<button type="button" class="btn btn-success btn-sm" onclick="cambiarEstadoProducto(<?= $value['idproducto'] ?>,1)"><i class="fa fa-check"></i> Act</button>
				<?php } ?>
			</td>
			<td><button type="button" class="btn btn-danger btn-sm" onclick="cambiarEstadoProducto(<?= $value['idproducto'] ?>,2)"><i class="fa fa-times"></i> Eli</button></td> -->
		</tr>
		<?php } ?>
	</tbody>
</table>
<script>
	$("#tableProducto").DataTable({
    	"responsive": true, 
    	"lengthChange": true, 
    	"autoWidth": false,
    	"searching": false,
    	"ordering": true,
    	//Mantener la Cabecera de la tabla Fija
    	// "scrollY": '200px',
        // "scrollCollapse": true,
        // "paging": false,
    	"lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]],
    	"language": {
			"decimal":        "",
		    "emptyTable":     "Sin datos",
		    "info":           "Del _START_ al _END_ de _TOTAL_ filas",
		    "infoEmpty":      "Del 0 a 0 de 0 filas",
		    "infoFiltered":   "(filtro de _MAX_ filas totales)",
		    "infoPostFix":    "",
		    "thousands":      ",",
		    "lengthMenu":     "Ver _MENU_ filas",
		    "loadingRecords": "Cargando...",
		    "processing":     "Procesando...",
		    "search":         "Buscar:",
		    "zeroRecords":    "No se encontraron resultados",
		    "paginate": {
		        "first":      "Primero",
		        "last":       "Ultimo",
		        "next":       "Siguiente",
		        "previous":   "Anterior"
		    },
		    "aria": {
		        "sortAscending":  ": orden ascendente",
		        "sortDescending": ": orden descendente"
		    }
		},
    	"buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#tableProducto_wrapper .col-md-6:eq(0)');

    function editarProducto(id){
    	$.ajax({
    		method: "POST",
    		url: "controlador/contProducto.php",
    		data: {
    			accion: 'CONSULTAR_PRODUCTO',
    			idproducto: id
    		},
    		dataType: "json"
    	})
    	.done(function(resultado){
    		$('#nombre').val(resultado.nombre);
    		$('#estado').val(resultado.estado);
    		$('#codigobarra').val(resultado.codigobarra);
    		$('#pventa').val(resultado.pventa);
    		$('#pcompra').val(resultado.pcompra);
    		$('#stock').val(resultado.stock);
    		$('#idunidad').val(resultado.idunidad);
    		$('#idcategoria').val(resultado.idcategoria);
    		$('#idafectacion').val(resultado.idafectacion);
    		$('#afectoicbper').val(resultado.afectoicbper);
    		$('#stockseguridad').val(resultado.stockseguridad);

    		// $('#formCategoria').trigger('reset');
	    	$('#idproducto').val(id);
	    	$('#modalProducto').modal('show');
    	});    	
    }

    function cambiarEstadoProducto(idproducto, estado){
    	proceso = new Array('ANULAR','ACTIVAR','ELIMINAR');
    	mensaje = "¿Esta Seguro de <b>"+proceso[estado]+"</b> el producto?";
    	accion = "EjecutarCambiarEstadoProducto("+idproducto+","+estado+")";

    	mostrarModalConfirmacion(mensaje, accion);

    }

    function EjecutarCambiarEstadoProducto(idproducto,estado){
    	$.ajax({
    		method: 'POST',
    		url: 'controlador/contProducto.php',
    		data:{
    			'accion': 'CAMBIAR_ESTADO_PRODUCTO',
    			'idproducto': idproducto,
    			'estado': estado
    		},
    		dataType: 'json'
    	})
    	.done(function(resultado){
    		if(resultado.correcto==1){
    			toastCorrecto(resultado.mensaje);
    			verListado();
    		}else{
    			toastError(resultado.mensaje);
    		}
    	});
    }


    function subirImagen(id){
    	$.ajax({
    		method: "POST",
    		url: "controlador/contProducto.php",
    		data: {
    			accion: 'CONSULTAR_PRODUCTO',
    			idproducto: id
    		},
    		dataType: "json"
    	})
    	.done(function(resultado){
    		$('#nombre_imagen').val(resultado.nombre);
    		$('#urlimagen').val(resultado.urlimagen);

    		// $('#formCategoria').trigger('reset');
	    	$('#idproducto_imagen').val(id);

	    	$("#uploadFile").fileinput({
					language: 'es',
					showRemove: false,
					uploadAsync: true,
					uploadExtraData: {
						accion: 'SUBIR_IMAGEN', 
						idproducto: $('#idproducto_imagen').val()
					},
					uploadUrl: 'controlador/contProducto.php',
					maxFileCount: 1,
					autoReplace: true, 
					allowedFileExtensions: ['jpg','png','jpeg']
			}).on('fileuploaded', function(event, data, id, index) {
			    $('#modalProducto_Imagen').modal('hide');
			    verListado();
			    $('#uploadFile').fileinput('destroy');
			})


	    	$('#modalProducto_Imagen').modal('show');
    	});    	
    }
</script>