CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevaRuta`(IN esPublica Bool, IN idLocacion INT, IN nombre VARCHAR(45), IN usuario VARCHAR(45), IN fecha DATE, IN descripcion VARCHAR(45), IN rutaEstado INT)
BEGIN
	INSERT INTO ruta (es_publica, id_locacion, nombre_ruta, creado_por, creado_el, descripcion, id_ruta_estado)
	VALUES (esPublica, idLocacion, nombre,usuario , fecha, descripcion, rutaEstado);
END