
DELIMITER $$

-- Procedimiento para registrar un nuevo paciente
DROP PROCEDURE IF EXISTS `proc_registrar_paciente`$$
CREATE PROCEDURE proc_registrar_paciente(
    IN v_id_paciente VARCHAR(6),
    IN v_nombre_paciente VARCHAR(45),
    IN v_apellido_paciente VARCHAR(45),
    IN v_telefono_paciente INT
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
        VALUES ('pacientes', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de paciente' AS estado;
    END;
    
    INSERT INTO pacientes (idpaciente, nombre_paciente, apellido_paciente, telefono_paciente) 
    VALUES (v_id_paciente, v_nombre_paciente, v_apellido_paciente, v_telefono_paciente);
    SELECT 'Paciente registrado exitosamente' AS estado;
    
END$$

-- Procedimiento para consultar un paciente específico
DROP PROCEDURE IF EXISTS `proc_buscar_paciente`$$
CREATE PROCEDURE proc_buscar_paciente(
    IN v_id_paciente VARCHAR(6)
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
        VALUES ('pacientes', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar paciente' AS estado;
    END;

    SELECT idpaciente, nombre_paciente, apellido_paciente, telefono_paciente 
    FROM pacientes 
    WHERE idpaciente = v_id_paciente;
    
END$$

-- Procedimiento para modificar datos de un paciente
DROP PROCEDURE IF EXISTS `proc_actualizar_paciente`$$
CREATE PROCEDURE proc_actualizar_paciente(
    IN v_id_paciente VARCHAR(6),
    IN v_nombre_paciente VARCHAR(45),
    IN v_apellido_paciente VARCHAR(45),
    IN v_telefono_paciente INT
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
        VALUES ('pacientes', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar paciente' AS estado;
    END;

    UPDATE pacientes 
    SET nombre_paciente = v_nombre_paciente, 
        apellido_paciente = v_apellido_paciente, 
        telefono_paciente = v_telefono_paciente 
    WHERE idpaciente = v_id_paciente;
    
    SELECT 'Paciente actualizado exitosamente' AS estado;
    
END$$

-- Procedimiento para eliminar un paciente
DROP PROCEDURE IF EXISTS `proc_eliminar_paciente`$$
CREATE PROCEDURE proc_eliminar_paciente(
    IN v_id_paciente VARCHAR(6)
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
        VALUES ('pacientes', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar paciente' AS estado;
    END;

    DELETE FROM pacientes 
    WHERE idpaciente = v_id_paciente;
    
    SELECT 'Paciente eliminado correctamente' AS estado;
    
END$$

DELIMITER ;
