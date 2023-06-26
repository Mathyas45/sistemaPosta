<?php
	require_once('../modelo/clsConsultorios.php');

	$objCat = new clsConsultorios();

	$nombre = $_POST['nombre'];
	$estado = $_POST['estado'];

	$listaConsultorios = $objCat->listarConsultorios($nombre, $estado);
	$listaConsultorios = $listaConsultorios->fetchAll(PDO::FETCH_NAMED);
?>
<table id="tableConsultorios" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>COD</th>
			<th>DESCRIPCION</th>
			<th>ESTADO</th>
			<th>EDITAR</th>
			<th>ANULAR</th>
			<th>ELIMINAR</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($listaConsultorios as $key => $value) { 
			$class = "";
			$tdclass = "";
			if($value['estado']==0){
				$class = "text-red";
				$tdclass = "bg-danger";
			}
		?>
		<tr class="<?= $class ?>">
			<td><?= $value['idconsultorios'] ?></td>
			<td><?= $value['nombre'] ?></td>
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
				<button type="button" class="btn btn-warning btn-mg" onclick="editarConsultorios(<?= $value['idconsultorios'] ?>)"><i class="fa fa-edit"></i> Editar</button>
			</td>
			<td>
				<?php if($value['estado']==1){ ?>
				<button type="button" class="btn btn-custom btn-mg " style="background-color: #FF4500;" onclick="cambiarEstadoConsultorios(<?= $value['idconsultorios'] ?> ,0)"><i class="fa-solid fa-ban"></i> Anular</button>
				<?php }else{ ?>
				<button type="button" class="btn btn-success btn-mg" onclick="cambiarEstadoConsultorios(<?= $value['idconsultorios'] ?> ,1)"><i class="fa fa-check"></i> Activar</button>
				<?php } ?>
			</td>
			<td><button type="button" class="btn btn-danger btn-mg" onclick="cambiarEstadoConsultorios(<?= $value['idconsultorios'] ?> ,2)"><i class="fa-regular fa-trash-can"></i> Eliminar</button></td>
		</tr>
		<?php } ?>
	</tbody>
</table>
<script>
	$("#tableConsultorios").DataTable({
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
    }).buttons().container().appendTo('#tableConsultorios_wrapper .col-md-6:eq(0)');

function editarConsultorios(id){
	$.ajax({ 
		method:"POST",
		url :"controlador/contConsultorios.php",
		data :{
			accion: "CONSULTAR_CONSULTORIOS",
			idconsultorios: id
		},
		dataType: 'json',
	})
	.done(function(resultado){

		$('#nombre').val(resultado.nombre);
		$('#estado').val(resultado.estado);

		//$('#formConsultorios').trigger('reset');//Para que se limpie el modal al abrir el modal(ACA NO SE NECESITA pq traera datos)
		$('#idconsultorios').val(id);
		$('#modalConsultorios').modal('show');
		});
}

function cambiarEstadoConsultorios(idconsultorios, estado){
	proceso = new Array('ANULAR','ACTIVAR','ELIMINAR');
	mensaje = "¿Esta Seguro de <b>"+proceso[estado]+"</b> la consultorios?";
	accion = "EjecutarCambiarEstadoConsultorios("+idconsultorios+","+estado+")";

	mostrarModalConfirmacion(mensaje, accion);

    }

function EjecutarCambiarEstadoConsultorios(idconsultorios,estado){
	$.ajax({
		method: 'POST',
		url: 'controlador/contConsultorios.php',
		data:{
			'accion': 'CAMBIAR_ESTADO_CONSULTORIOS',
			'idconsultorios': idconsultorios,
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
</script>