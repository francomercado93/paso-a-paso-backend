CREATE DEFINER=`root`@`localhost` PROCEDURE `rutaPorId`(IN IdRuta VARCHAR(45))
BEGIN
	SELECT r.id_ruta AS id, IF(r.es_publica, 'true', 'false') as esPublica , l.nombre_locacion AS locacion, r.nombre_ruta AS nombre, r.creado_por AS usuario, r.creado_el AS fechaCreacion, r.descripcion, re.descripcion as estado
	FROM ruta r 
	INNER JOIN locacion l on l.id_locacion = r.id_locacion
	INNER JOIN ruta_estado re on re.id_ruta_estado = r.id_ruta_estado
	WHERE r.id_ruta = IdRuta;
END