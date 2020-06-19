CREATE DEFINER=`root`@`localhost` PROCEDURE `rutasPorLocacion`(IN IdLocacion VARCHAR(45))
BEGIN
SELECT r.id_ruta as id, IF(r.es_publica, 'true', 'false') as esPublica , l.nombre_locacion as locacion, r.nombre_ruta as nombre, r.creado_por as usuario, r.creado_el as fechaCreacion, r.descripcion, re.descripcion as estado
FROM ruta r 
INNER JOIN locacion l on l.id_locacion = r.id_locacion
INNER JOIN ruta_estado re on re.id_ruta_estado = r.id_ruta_estado
WHERE l.id_locacion = IdLocacion;
END