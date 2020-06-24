CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevaRuta`(IN esPublica Bool, IN locacion VARCHAR(45), IN nombre VARCHAR(45), IN usuario VARCHAR(45), IN fecha DATE, IN descripcion VARCHAR(45), IN rutaEstado INT)
BEGIN
	DECLARE l_ruta_id INT DEFAULT 0;
	DECLARE idLocacion INT DEFAULT 0;
    
    SET idLocacion = (SELECT l.id_locacion as idLocacion FROM locacion l
						WHERE l.nombre_locacion = locacion);
                        
	INSERT INTO ruta (es_publica, id_locacion, nombre_ruta, creado_por, creado_el, descripcion, id_ruta_estado)
	VALUES (esPublica, idLocacion, nombre,usuario , fecha, descripcion, rutaEstado);
    
	SET l_ruta_id = LAST_INSERT_ID();
    SELECT r.id_ruta FROM ruta r WHERE r.id_ruta = l_ruta_id;
END