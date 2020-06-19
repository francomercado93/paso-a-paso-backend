CREATE DEFINER=`root`@`localhost` PROCEDURE `locacionesPorNombre`(IN nombre VARCHAR(45))
BEGIN
select l.id_locacion, l.nombre_locacion, l.direccion, l.ciudad, p.nombre as provincia, tl.tipo as tipo_locacion, IF(l.es_publica, 'true', 'false') as esPublica , l.usuario from locacion l
    inner join provincia p on p.id_provincia = l.id_provincia
    inner join tipo_locacion tl on tl.id_tipo_locacion = l.id_tipo_locacion
    where l.nombre_locacion like CONCAT('%', nombre , '%');
END