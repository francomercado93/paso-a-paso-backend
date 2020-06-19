CREATE DEFINER=`root`@`localhost` PROCEDURE `categorias`()
BEGIN
	SELECT tl.id_tipo_locacion AS id, tl.tipo AS nombre FROM tipo_locacion tl;
END