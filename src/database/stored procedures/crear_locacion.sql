CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_locacion`(IN nombre VARCHAR(45), IN direccion VARCHAR(45), IN ciudad VARCHAR(45), IN id_provincia INT, IN id_tipoLocacion INT, IN esPublica Boolean, IN usuario VARCHAR(45))
BEGIN
	INSERT INTO locacion ( nombre_locacion, direccion, ciudad, id_provincia, id_tipo_locacion, es_publica, usuario)
	VALUES (nombre, direccion, ciudad, id_provincia, id_tipoLocacion, IF(esPublica = false, 1, 0), usuario);
END