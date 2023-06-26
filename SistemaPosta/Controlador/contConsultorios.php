<?php
require_once('../modelo/clsConsultorios.php');

controlador($_POST['accion']);

function controlador($accion){
	$objCon = new clsConsultorios();

	switch ($accion) {
		case 'NUEVO':
			$resultado = array();
			try {

				
				$nombre = $_POST['nombre'];
				$estado = $_POST['estado'];

				$existeConsultorios = $objCon->verificarDuplicado($nombre);
				if($existeConsultorios->rowCount()>0){
					throw new Exception("Existe una consultorios Registrada con el mismo nombre", 1);
					
				}
					
				$objCon->insertarConsultorios($nombre, $estado);
				$resultado['correcto']=1;
				$resultado['mensaje'] = 'Consultorios Registrada de forma satisfactoria.';

				echo json_encode($resultado);
				
			} catch (Exception $e) {
				$resultado['correcto']=0;
				$resultado['mensaje'] = $e->getMessage();
				echo json_encode($resultado);
			}
			break;

		case 'CONSULTAR_CONSULTORIOS':
			try {
				$idconsultorios = $_POST['idconsultorios'];

				$resultado = $objCon->consultarConsultorios($idconsultorios);
				$resultado = $resultado->fetch(PDO::FETCH_NAMED);
				echo json_encode($resultado);
				
			} catch (Exception $e) {
				$resultado = array('correcto'=>0, 'mensaje'=>$e->getMessage());
				echo json_encode($resultado);
			}
			break;

		case 'ACTUALIZAR':
			$resultado = array();
			try {
				$idconsultorios = $_POST['idconsultorios'];
				$nombre = $_POST['nombre'];
				$estado = $_POST['estado'];

				$existeConsultorios = $objCon->verificarDuplicado($nombre, $idconsultorios);
				if($existeConsultorios->rowCount()>0){
					throw new Exception("Existe una consultorios Registrada con el mismo nombre", 1);
					
				}

				$objCon->actualizarConsultorios($idconsultorios, $nombre, $estado);

				$resultado['correcto']=1;
				$resultado['mensaje']="Consultorios actualizada de forma satisfactoria.";
				echo json_encode($resultado);

			} catch (Exception $e) {
				$resultado['correcto']=0;
				$resultado['mensaje']=$e->getMessage();

				echo json_encode($resultado);
			}
			break;

		case 'CAMBIAR_ESTADO_CONSULTORIOS':
			$resultado = array();
			try {
				$idconsultorios = $_POST['idconsultorios'];
				$estado = $_POST['estado'];
				$arrayEstado = array('ANULADA','ACTIVADA','ELIMINADA');

				$objCon->actualizarEstadoConsultorios($idconsultorios, $estado);

				$resultado['correcto']=1;
				$resultado['mensaje']='La consultorios ha sido '.$arrayEstado[$estado].' de forma satisfactoria';

				echo json_encode($resultado);
				
			} catch (Exception $e) {
				$resultado['correcto']=0;
				$resultado['mensaje']=$e->getMessage();

				echo json_encode($resultado);
			}
			break;
		
		default:
			echo "No ha definido una accion";
			break;
	}

}

?>