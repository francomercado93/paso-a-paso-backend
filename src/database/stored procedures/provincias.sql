CREATE DEFINER=`root`@`localhost` PROCEDURE `provincias`()
BEGIN
	SELECT p.id_provincia AS id, p.nombre FROM provincia p;
END