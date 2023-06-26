<?php
require_once('conexion.php');

class clsConsultorios{

	function listarConsultorios($nombre, $estado){
		$sql = "SELECT * FROM consultorios WHERE estado<2";
		$parametros = array();

		if($nombre!=""){
			$sql .= " AND nombre LIKE :nombre ";
			$parametros[':nombre'] = "%".$nombre."%";
		}

		if($estado!=""){
			$sql .= " AND estado = :estado ";
			$parametros[':estado'] = $estado;
		}

		$sql .= " ORDER BY nombre ASC";

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function insertarConsultorios($nombre, $estado){
		$sql = "INSERT INTO consultorios VALUES(null,:nombre,:estado)";
		$parametros = array(":nombre"=>$nombre, ":estado"=>$estado);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function verificarDuplicado($nombre, $idconsultorios=0){
		$sql = "SELECT * FROM consultorios WHERE estado<2 AND nombre=:nombre AND idconsultorios<>:idconsultorios";
		$parametros = array(":nombre"=>$nombre, ":idconsultorios"=>$idconsultorios);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function consultarConsultorios($idconsultorios){
		$sql = "SELECT * FROM consultorios WHERE idconsultorios=:idconsultorios ";
		$parametros = array(":idconsultorios"=>$idconsultorios);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function actualizarConsultorios($idconsultorios, $nombre, $estado){
		$sql = "UPDATE consultorios SET nombre=:nombre, estado=:estado WHERE idconsultorios=:idconsultorios";
		$parametros = array(':idconsultorios'=>$idconsultorios, ':nombre'=>$nombre, ':estado'=>$estado);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function actualizarEstadoConsultorios($idconsultorios, $estado){
		$sql = "UPDATE consultorios SET estado=:estado WHERE idconsultorios=:idconsultorios";
		$parametros = array(":estado"=>$estado, ":idconsultorios"=>$idconsultorios);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

}


?>