CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarioLogin`(IN usuario VARCHAR(45), IN password VARCHAR(45))
BEGIN
	SELECT u.usuario, u.alias, u.nombre, u.apellido, u.password, u.es_vidente as esVidente, tu.tipo_usuario as tipoUsuario, p.nombre as provincia , u.ciudad 
	FROM usuario u
	INNER JOIN tipo_usuario tu ON tu.id_tipo_usuario = u.id_tipo_usuario
	INNER JOIN provincia p ON p.id_provincia = u.id_provincia
    WHERE u.usuario LIKE usuario AND u.password LIKE password;
END