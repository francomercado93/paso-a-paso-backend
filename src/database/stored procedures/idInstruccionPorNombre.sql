CREATE DEFINER=`root`@`localhost` PROCEDURE `idInstruccionPorNombre`(IN nombre VARCHAR(45))
BEGIN
	SELECT ti.id_tipo_instruccion as idInstruccion FROM tipo_instruccion ti
    WHERE ti.instruccion LIKE '%nombre%';
END