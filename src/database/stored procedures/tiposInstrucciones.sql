CREATE DEFINER=`root`@`localhost` PROCEDURE `tiposInstrucciones`()
BEGIN
	SELECT ti.id_tipo_instruccion as id, ti.instruccion as nombre FROM tipo_instruccion ti;
END