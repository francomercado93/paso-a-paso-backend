CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInstruccion`(IN ruta INT, IN tipoInstruccion VARCHAR(45), IN cantidad INT )
BEGIN
	DECLARE idInstruccion INT DEFAULT 0;
	SET idInstruccion = (SELECT ti.id_tipo_instruccion FROM tipo_instruccion ti WHERE ti.instruccion = tipoInstruccion);
	INSERT INTO instruccion (id_ruta, id_tipo_instruccion, cantidad)
	VALUES  (ruta, idInstruccion ,cantidad);
END