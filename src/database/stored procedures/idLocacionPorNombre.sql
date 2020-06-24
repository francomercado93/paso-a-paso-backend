CREATE DEFINER=`root`@`localhost` PROCEDURE `idLocacionPorNombre`(IN nombre VARCHAR(45))
BEGIN
	SELECT l.id_locacion as idLocacion FROM locacion l
    WHERE l.nombre_locacion = nombre;
END