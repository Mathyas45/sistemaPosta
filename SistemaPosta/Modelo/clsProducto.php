<?php
require_once('conexion.php');

class clsProducto{

	function listarProducto($codigo, $nombre, $idcategoria, $estado, $filtro=''){
		$sql = "SELECT pro.*, und.descripcion as 'unidad' FROM producto pro INNER JOIN unidad und ON pro.idunidad=und.idunidad WHERE pro.estado<2 AND und.estado<2";
		$parametros = array();

		if($codigo!=""){
			$sql .= " AND pro.codigobarra LIKE :codigo ";
			$parametros[':codigo'] = "%".$codigo."%";
		}

		if($nombre!=""){
			$sql .= " AND pro.nombre LIKE :nombre ";
			$parametros[':nombre'] = "%".$nombre."%";
		}

		if($idcategoria!=""){
			$sql .= " AND pro.idcategoria = :idcategoria ";
			$parametros[':idcategoria'] = $idcategoria; 
		}

		if($estado!=""){
			$sql .= " AND pro.estado = :estado ";
			$parametros[':estado'] = $estado;
		}

		if($filtro!=""){
			if($filtro=="PSS"){
				$sql .=" AND pro.stock<=0 ";
			}else if($filtro=="PSM"){
				$sql .=" AND pro.stock<pro.stockseguridad ";
			}else if($filtro=="PCS"){
				$sql .=" AND pro.stock>0 ";
			}
		}

		$sql .= " ORDER BY pro.nombre ASC";

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function consultarUnidad(){
		$sql = "SELECT * FROM unidad WHERE estado=1 ";
		$parametros = array();

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function consultarAfectacion(){
		$sql = "SELECT * FROM afectacion";
		$parametros = array();

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function insertarProducto($codigo,$nombre,$estado,$pventa,$pcompra,$stock,$stockseguridad,$idunidad,$idcategoria,$idafectacion,$afectoicbper){
		$sql = "INSERT INTO producto(nombre, codigobarra, pventa, pcompra, stock, idunidad, idcategoria, idafectacion, afectoicbper, estado, stockseguridad) VALUES(:nombre, :codigobarra, :pventa, :pcompra, :stock, :idunidad, :idcategoria, :idafectacion, :afectoicbper, :estado, :stockseguridad)";
		$parametros = array(
			":nombre"=>$nombre, 
			":codigobarra"=>$codigo, 
			":pventa"=>$pventa, 
			":pcompra"=>$pcompra, 
			":stock"=>$stock, 
			":idunidad"=>$idunidad, 
			":idcategoria"=>$idcategoria, 
			":idafectacion"=>$idafectacion, 
			":afectoicbper"=>$afectoicbper, 
			":estado"=>$estado, 
			":stockseguridad"=>$stockseguridad
		);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function verificarDuplicado($nombre, $idproducto=0){
		$sql = "SELECT * FROM producto WHERE estado<2 AND nombre=:nombre AND idproducto<>:idproducto";
		$parametros = array(":nombre"=>$nombre, ":idproducto"=>$idproducto);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function consultarProducto($idproducto){
		$sql = "SELECT pr.*, un.descripcion FROM producto pr INNER JOIN unidad un ON pr.idunidad= un.idunidad WHERE pr.idproducto=:idproducto ";
		$parametros = array(":idproducto"=>$idproducto);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function actualizarProducto($idproducto, $codigo,$nombre,$estado,$pventa,$pcompra,$stock,$stockseguridad,$idunidad,$idcategoria,$idafectacion,$afectoicbper){
		$sql = "UPDATE producto SET nombre=:nombre, codigobarra=:codigobarra, pventa=:pventa, pcompra=:pcompra, stock=:stock, idunidad=:idunidad, idcategoria=:idcategoria, idafectacion=:idafectacion, afectoicbper=:afectoicbper, estado=:estado, stockseguridad=:stockseguridad WHERE idproducto=:idproducto";
		$parametros = array(
			":idproducto"=>$idproducto, 
			":nombre"=>$nombre, 
			":codigobarra"=>$codigo, 
			":pventa"=>$pventa, 
			":pcompra"=>$pcompra, 
			":stock"=>$stock, 
			":idunidad"=>$idunidad, 
			":idcategoria"=>$idcategoria, 
			":idafectacion"=>$idafectacion, 
			":afectoicbper"=>$afectoicbper, 
			":estado"=>$estado, 
			":stockseguridad"=>$stockseguridad
		);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function actualizarEstadoProducto($idproducto, $estado){
		$sql = "UPDATE producto SET estado=:estado WHERE idproducto=:idproducto";
		$parametros = array(":estado"=>$estado, ":idproducto"=>$idproducto);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function actualizarImagen($idproducto, $imagen){
		$sql = "UPDATE producto SET urlimagen=:imagen WHERE idproducto=:idproducto";
		$parametros = array(":imagen"=>$imagen, ":idproducto"=>$idproducto);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function actualizarStock($idproducto, $cantidad){
        $sql = "UPDATE producto SET stock=stock+:cantidad WHERE idproducto=:idproducto";
        global $cnx;
        $parametros = array(":idproducto"=>$idproducto,":cantidad"=>$cantidad);
        $pre= $cnx->prepare($sql);
        $pre->execute($parametros);
        return $pre;        
    }

    function detalleVentaPorProducto($idproducto){
    	$sql = "SELECT DATE_FORMAT(t1.fecha, '%d/%m/%Y') as 'fecha', CONCAT(t3.nombre,' ',t1.serie,'-',t1.correlativo) as 'documento', t4.nombre as 'cliente', t2.cantidad, t2.pventa, t2.total FROM venta t1 INNER JOIN detalle t2 ON t1.idventa=t2.idventa INNER JOIN tipocomprobante t3 ON t1.idtipocomprobante=t3.idtipocomprobante LEFT JOIN cliente t4 ON t1.idcliente=t4.idcliente WHERE t1.estado=1 AND t2.estado=1 AND t2.idproducto=:idproducto ORDER BY t1.fecha ASC, t1.idtipocomprobante ASC, t1.correlativo ASC";
    	$parametros = array(':idproducto'=>$idproducto);

    	global $cnx;
    	$pre = $cnx->prepare($sql);
    	$pre->execute($parametros);
    	return $pre;
    }

    function verificarDuplicadoUnidad($nombre, $idunidad=''){
		$sql = "SELECT * FROM unidad WHERE estado<2 AND descripcion=:nombre AND idunidad<>:idunidad";
		$parametros = array(":nombre"=>$nombre, ":idunidad"=>$idunidad);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function insertarUnidad($idunidad ,$nombre, $estado){
		$sql = "INSERT INTO unidad VALUES(:idunidad,:nombre,:estado)";
		$parametros = array(":idunidad"=>$idunidad, ":nombre"=>$nombre, ":estado"=>$estado);

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function contarProductos(){
		$sql = "SELECT COUNT(*) FROM producto WHERE estado=1";
		$parametros = array();

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function listaProductoConProblemaStock(){
		$sql = "SELECT pr.*, un.descripcion as 'unidad' FROM producto pr INNER JOIN unidad un ON un.idunidad=pr.idunidad WHERE pr.estado=1 AND pr.stock<pr.stockseguridad";
		$parametros = array();

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}

	function listaProductoMasVendidos(){
		$sql = "SELECT de.idproducto, pr.nombre, un.descripcion as 'unidad', SUM(de.cantidad) as 'cantidad' FROM venta ve INNER JOIN detalle de ON de.idventa=ve.idventa INNER JOIN producto pr ON de.idproducto= pr.idproducto INNER JOIN unidad un ON pr.idunidad=un.idunidad WHERE ve.estado=1 AND de.estado=1 AND ve.fecha=CURDATE() GROUP BY de.idproducto ORDER BY cantidad DESC LIMIT 10 ";
		$parametros = array();

		global $cnx;
		$pre = $cnx->prepare($sql);
		$pre->execute($parametros);
		return $pre;
	}


}
?>