
DELIMITER $$

-- Procedimiento para registrar una nueva facultad
DROP PROCEDURE IF EXISTS `proc_registrar_facultad`$$
CREATE PROCEDURE proc_registrar_facultad(
    IN v_id_facultad VARCHAR(6),
    IN v_nombre_facultad VARCHAR(45),
    IN v_decano VARCHAR(45)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO bitacora_errores(tabla, codigo, descripcion) 
        VALUES ('facultades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de facultad' AS estado;
    END;

    INSERT INTO facultades (idfacultad, nombre_facultad, decano_facultad) 
    VALUES (v_id_facultad, v_nombre_facultad, v_decano);
    SELECT 'Facultad registrada exitosamente' AS estado;

END$$

-- Procedimiento para consultar una facultad específica
DROP PROCEDURE IF EXISTS `proc_buscar_facultad`$$
CREATE PROCEDURE proc_buscar_facultad(
    IN v_id_facultad VARCHAR(6)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO bitacora_errores(tabla, codigo, descripcion) 
        VALUES ('facultades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar facultad' AS estado;
    END;

    SELECT idfacultad, nombre_facultad, decano_facultad 
    FROM facultades 
    WHERE idfacultad = v_id_facultad;

END$$

-- Procedimiento para modificar datos de una facultad
DROP PROCEDURE IF EXISTS `proc_actualizar_facultad`$$
CREATE PROCEDURE proc_actualizar_facultad(
    IN v_id_facultad VARCHAR(6),
    IN v_nombre_facultad VARCHAR(45),
    IN v_decano VARCHAR(45)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO bitacora_errores(tabla, codigo, descripcion) 
        VALUES ('facultades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar facultad' AS estado;
    END;

    UPDATE facultades 
    SET nombre_facultad = v_nombre_facultad, 
        decano_facultad = v_decano 
    WHERE idfacultad = v_id_facultad;
    
    SELECT 'Facultad actualizada exitosamente' AS estado;

END$$

-- Procedimiento para eliminar una facultad
DROP PROCEDURE IF EXISTS `proc_eliminar_facultad`$$
CREATE PROCEDURE proc_eliminar_facultad(
    IN v_id_facultad VARCHAR(6)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO bitacora_errores(tabla, codigo, descripcion) 
        VALUES ('facultades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar facultad' AS estado;
    END;

    DELETE FROM facultades 
    WHERE idfacultad = v_id_facultad;
    
    SELECT 'Facultad eliminada correctamente' AS estado;

END$$

DELIMITER ;
