<?php
require_once('../modelo/clsCitas.php');

controlador($_POST['accion']);

function controlador($accion){
	$objCit = new clsCitas();


	switch ($accion) {
		case 'NUEVO':
			$resultado = array();
			try {
			
				$idcitas = $_POST['idcitas'];
				$idcliente = $_POST['idcliente'];
				$idconsultorios = $_POST['idconsultorios'];
				$fecha_inicio = $_POST['fecha_inicio'];
				$hora = $_POST['hora'];
			

				$existeProducto = $objCit->verificarDuplicado($idcitas);
				if($existeProducto->rowCount()>0){
					throw new Exception("Existe un producto Registrado con el mismo nombre", 1);
					
				}
					
				$objCit->insertarCitas($idcitas, $idcliente, $idconsultorios, $fecha_inicio, $hora);
				$resultado['correcto']=1;
				$resultado['mensaje'] = 'Producto Registrado de forma satisfactoria.';

				echo json_encode($resultado);
				
			} catch (Exception $e) {
				$resultado['correcto']=0;
				$resultado['mensaje'] = $e->getMessage();
				echo json_encode($resultado);
			}
			break;

		// case 'CONSULTAR_CITAS':
		// 	try {
		// 		$idcitas = $_POST['idcitas'];

		// 		$resultado = $objCit->consultarCitas($idcitas);
		// 		$resultado = $resultado->fetch(PDO::FETCH_NAMED);
		// 		echo json_encode($resultado);
				
		// 	} catch (Exception $e) {
		// 		$resultado = array('correcto'=>0, 'mensaje'=>$e->getMessage());
		// 		echo json_encode($resultado);
		// 	}
		// 	break;

		// case 'ACTUALIZAR':
		// 	$resultado = array();
		// 	try {
		// 		$idcitas = $_POST['idcitas'];
		// 		$codigo = $_POST['codigobarra'];
		// 		$nombre = $_POST['nombre'];
		// 		$estado = $_POST['estado'];
		// 		$pventa = $_POST['pventa'];
		// 		$pcompra = $_POST['pcompra'];
		// 		$stock = $_POST['stock'];
		// 		$stockseguridad = $_POST['stockseguridad'];
		// 		$idunidad = $_POST['idunidad'];
		// 		$idcategoria = $_POST['idcategoria'];
		// 		$idafectacion = $_POST['idafectacion'];
		// 		$afectoicbper = $_POST['afectoicbper'];

		// 		$existeCitas= $objCit->verificarDuplicado($nombre, $idcitas);
		// 		if($existeCitas->rowCount()>0){
		// 			throw new Exception("Existe un Citas Registrado con el mismo nombre", 1);
					
		// 		}

		// 		$objCit->actualizarCitas($idcitas, $codigo,$nombre,$estado,$pventa,$pcompra,$stock,$stockseguridad,$idunidad,$idcategoria,$idafectacion,$afectoicbper);

		// 		$resultado['correcto']=1;
		// 		$resultado['mensaje']="Citas actualizado de forma satisfactoria.";
		// 		echo json_encode($resultado);

		// 	} catch (Exception $e) {
		// 		$resultado['correcto']=0;
		// 		$resultado['mensaje']=$e->getMessage();

		// 		echo json_encode($resultado);
		// 	}
		// 	break;

		// case 'CAMBIAR_ESTADO_CITAS':
		// 	$resultado = array();
		// 	try {
		// 		$idcitas = $_POST['idcitas'];
		// 		$estado = $_POST['estado'];
		// 		$arrayEstado = array('ANULADA','ACTIVADA','ELIMINADA');

		// 		$objCit->actualizarEstadoCitas($idcitas, $estado);

		// 		$resultado['correcto']=1;
		// 		$resultado['mensaje']='El Citas ha sido '.$arrayEstado[$estado].' de forma satisfactoria';

		// 		echo json_encode($resultado);
				
		// 	} catch (Exception $e) {
		// 		$resultado['correcto']=0;
		// 		$resultado['mensaje']=$e->getMessage();

		// 		echo json_encode($resultado);
		// 	}
		// 	break;

		// case 'SUBIR_IMAGEN':
		// 	try {

		// 		if(empty($_FILES)) {
		// 			throw new Exception("No se encontraron archivos para cargar.", 123);
		// 		}

		// 		$idcitas = $_POST['idcitas'];
		// 		$archivo = $_FILES['uploadFile'];
		// 		$ruta = "imagen/citass/IMG_".$idcitas.$archivo["name"];
		// 		move_uploaded_file($archivo["tmp_name"], '../'.$ruta);
		// 		$objCit->actualizarImagen($idcitas, $ruta);

		// 		echo '[]';
				
		// 	} catch (Exception $e) {
		// 		echo $e->getMessage();
		// 	}
		// 	break;

		// 	case 'DETALLE_VENTA_CITAS':
		// 	$resultado = array();
		// 	try {
		// 		$idcitas = $_POST['idcitas'];
				
		// 		$dataCitas = $objCit->consultarCitas($idcitas);
		// 		$dataCitas = $dataCitas->fetch(PDO::FETCH_NAMED);

		// 		$listado = $objCit->detalleVentaPorCitas($idcitas);
		// 		$listado = $listado->fetchAll(PDO::FETCH_NAMED);

		// 		$resultado='<p>'.$dataCitas['nombre'].'&nbsp;&nbsp;|&nbsp;&nbsp;<b>Unidad:</b> '.$dataCitas['descripcion'].'&nbsp;&nbsp;|&nbsp;&nbsp;<b>Stock Actual:</b> '.$dataCitas['stock'].'</p>';
		// 		$resultado.='<table class="table table-hover text-nowrap table-sm">';
		// 		$resultado.='<thead>';
		// 		$resultado.='<tr class="bg-maroon">
		// 						<th>FECHA</th>
		// 						<th>DOCUMENTO</th>
		// 						<th>CLIENTE</th>
		// 						<th>CANTIDAD</th>
		// 						<th>STOCK</th>
		// 					</tr>
		// 					</thead>
		// 					<tbody>';
		// 		$stock_acumulativo = 0;
		// 		foreach($listado as $k=>$v){
		// 			$stock_acumulativo = $stock_acumulativo - $v['cantidad'];
		// 			$resultado.='<tr>
		// 							<td>'.$v['fecha'].'</td>
		// 							<td>'.$v['documento'].'</td>
		// 							<td>'.$v['cliente'].'</td>
		// 							<td style="text-align: right">'.$v['cantidad'].'</td>
		// 							<td style="text-align: right">'.$stock_acumulativo.'</td>
		// 						</tr>';
		// 		}

		// 		$resultado.='</tbody>';
		// 		$resultado.='</table>';
				

		// 		echo $resultado;
				
		// 	} catch (Exception $e) {
		// 		$resultado= $e->getMessage();
		// 		echo $resultado;
		// 	}
		// 	break;

		// case 'NUEVA_UNIDAD':
		// 	$resultado = array();
		// 	try {

		// 		$codigo = $_POST['codigo_unidad'];
		// 		$nombre = $_POST['nombre_unidad'];
		// 		$estado = $_POST['estado'];

		// 		$existeUnidad = $objCit->verificarDuplicadoUnidad($nombre);
		// 		if($existeUnidad->rowCount()>0){
		// 			throw new Exception("Existe una Unidad Registrada con el mismo nombre", 1);
					
		// 		}
					
		// 		$objCit->insertarUnidad($codigo, $nombre, $estado);
		// 		$resultado['correcto']=1;
		// 		$resultado['mensaje'] = 'Unidad Registrada de forma satisfactoria.';

		// 		echo json_encode($resultado);
				
		// 	} catch (Exception $e) {
		// 		$resultado['correcto']=0;
		// 		$resultado['mensaje'] = $e->getMessage();
		// 		echo json_encode($resultado);
		// 	}
		// 	break;

		// case 'CONSULTAR_UNIDAD':
		// 	$resultado = array();
		// 	try {
				
				
		// 		$listado = $objCit->consultarUnidad();
		// 		$listado = $listado->fetchAll(PDO::FETCH_NAMED);

		// 		$resultado='<option value="">- Seleccione -</option>';
		// 		foreach($listado as $k=>$v){
		// 			$resultado.='<option value="'.$v['idunidad'].'">'.$v['descripcion'].'</option>';
		// 		}

		// 		echo $resultado;
				
		// 	} catch (Exception $e) {
		// 		$resultado= $e->getMessage();
		// 		echo $resultado;
		// 	}
		// 	break;
		
		default:
			echo "No ha definido una accion";
			break;
	}

}

?>