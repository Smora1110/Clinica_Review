DELIMITER $$

-- Procedimiento para registrar un nuevo médico
DROP PROCEDURE IF EXISTS `proc_registrar_medico`$$
CREATE PROCEDURE proc_registrar_medico(
    IN v_id_medico VARCHAR(6),
    IN v_nombre_medico VARCHAR(45),
    IN v_id_facultad VARCHAR(6),
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
        VALUES ('proc_registrar_medico', 'medicos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de médico' AS estado;
    END;
    
    INSERT INTO medicos (idmedico, nombre_medico, idfacultad, idespecialidad) 
    VALUES (v_id_medico, v_nombre_medico, v_id_facultad, v_id_especialidad);
    SELECT 'Médico registrado exitosamente' AS estado;
    
END$$

-- Procedimiento para consultar un médico específico
DROP PROCEDURE IF EXISTS `proc_buscar_medico`$$
CREATE PROCEDURE proc_buscar_medico(
    IN v_id_medico VARCHAR(6)
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
        VALUES ('proc_buscar_medico', 'medicos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar médico' AS estado;
    END;

    SELECT idmedico, nombre_medico, idfacultad, idespecialidad 
    FROM medicos 
    WHERE idmedico = v_id_medico;
    
END$$

-- Procedimiento para modificar datos de un médico
DROP PROCEDURE IF EXISTS `proc_actualizar_medico`$$
CREATE PROCEDURE proc_actualizar_medico(
    IN v_id_medico VARCHAR(6),
    IN v_nombre_medico VARCHAR(45),
    IN v_id_facultad VARCHAR(6),
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
        VALUES ('proc_actualizar_medico', 'medicos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar médico' AS estado;
    END;

    UPDATE medicos 
    SET nombre_medico = v_nombre_medico, 
        idfacultad = v_id_facultad, 
        idespecialidad = v_id_especialidad 
    WHERE idmedico = v_id_medico;
    
    SELECT 'Médico actualizado exitosamente' AS estado;
    
END$$

-- Procedimiento para eliminar un médico
DROP PROCEDURE IF EXISTS `proc_eliminar_medico`$$
CREATE PROCEDURE proc_eliminar_medico(
    IN v_id_medico VARCHAR(6)
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
        VALUES ('proc_eliminar_medico', 'medicos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar médico' AS estado;
    END;

    DELETE FROM medicos 
    WHERE idmedico = v_id_medico;
    
    SELECT 'Médico eliminado correctamente' AS estado;
    
END$$

DELIMITER ;
