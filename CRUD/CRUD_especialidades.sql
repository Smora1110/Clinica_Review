DELIMITER $$

-- Procedimiento para registrar una nueva especialidad
DROP PROCEDURE IF EXISTS `proc_registrar_especialidad`$$
CREATE PROCEDURE proc_registrar_especialidad(
    IN v_id_especialidad VARCHAR(6),
    IN v_nombre_especialidad VARCHAR(45)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('proc_registrar_especialidad', 'especialidades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de especialidad' AS estado;
    END;

    INSERT INTO especialidades (idespecialidad, especialidad) 
    VALUES (v_id_especialidad, v_nombre_especialidad);
    SELECT 'Registro de especialidad completado exitosamente' AS estado;

END$$

-- Procedimiento para consultar una especialidad específica
DROP PROCEDURE IF EXISTS `proc_buscar_especialidad`$$
CREATE PROCEDURE proc_buscar_especialidad(
    IN v_id_especialidad VARCHAR(6)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('proc_buscar_especialidad', 'especialidades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar especialidad' AS estado;
    END;

    SELECT idespecialidad, especialidad 
    FROM especialidades 
    WHERE idespecialidad = v_id_especialidad;

END$$

-- Procedimiento para modificar datos de una especialidad
DROP PROCEDURE IF EXISTS `proc_actualizar_especialidad`$$
CREATE PROCEDURE proc_actualizar_especialidad(
    IN v_id_especialidad VARCHAR(6),
    IN v_nombre_especialidad VARCHAR(45)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('proc_actualizar_especialidad', 'especialidades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar especialidad' AS estado;
    END;

    UPDATE especialidades 
    SET especialidad = v_nombre_especialidad 
    WHERE idespecialidad = v_id_especialidad;
    
    SELECT 'Especialidad actualizada exitosamente' AS estado;

END$$

-- Procedimiento para eliminar una especialidad
DROP PROCEDURE IF EXISTS `proc_eliminar_especialidad`$$
CREATE PROCEDURE proc_eliminar_especialidad(
    IN v_id_especialidad VARCHAR(6)
)
BEGIN
    DECLARE lc_codigo_error VARCHAR(10);
    DECLARE lc_descripcion_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            lc_codigo_error = RETURNED_SQLSTATE,
            lc_descripcion_error = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('proc_eliminar_especialidad', 'especialidades', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar especialidad' AS estado;
    END;

    DELETE FROM especialidades 
    WHERE idespecialidad = v_id_especialidad;
    
    SELECT 'Especialidad eliminada correctamente' AS estado;

END$$

DELIMITER ;
