CREATE DEFINER=`root`@`localhost` PROCEDURE `locacionesByTipo`(IN IdTipoLocacion INT)
BEGIN
	select l.id_locacion as id, l.nombre_locacion as nombre, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipoLocacion, IF(l.es_publica, 'true', 'false') as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion
    where l.id_tipo_locacion = IdTipoLocacion;
END