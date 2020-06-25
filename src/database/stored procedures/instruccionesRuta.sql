CREATE DEFINER=`root`@`localhost` PROCEDURE `instruccionesRuta`(IN IdRuta INT)
BEGIN
	SELECT i.id_instruccion AS id, r.nombre_ruta AS nombreRuta, i.numero_instruccion AS numeroInstruccion, ti.instruccion AS tipoInstruccion, i.cantidad 
	FROM instruccion i
	INNER JOIN ruta r ON r.id_ruta = i.id_ruta
	INNER JOIN tipo_instruccion ti ON ti.id_tipo_instruccion = i.id_tipo_instruccion
	WHERE i.id_ruta = IdRuta
    ORDER BY i.numero_instruccion ASC;
END