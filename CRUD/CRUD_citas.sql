DELIMITER $$

-- Procedimiento para registrar una nueva cita
DROP PROCEDURE IF EXISTS `proc_registrar_cita`$$
CREATE PROCEDURE proc_registrar_cita(
    IN v_id_cita VARCHAR(6),
    IN v_fecha_cita DATE,
    IN v_diagnostico VARCHAR(255),
    IN v_id_medico VARCHAR(6),
    IN v_id_paciente VARCHAR(6),
    IN v_id_hospital VARCHAR(6)
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
        VALUES ('proc_registrar_cita', 'citas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de cita' AS estado;
    END;

    INSERT INTO citas (idcita, fecha_cita, diagnostico, idmedico, idpaciente, idhospital) 
    VALUES (v_id_cita, v_fecha_cita, v_diagnostico, v_id_medico, v_id_paciente, v_id_hospital);
    SELECT 'Cita registrada exitosamente' AS estado;

END$$

-- Procedimiento para consultar una cita específica
DROP PROCEDURE IF EXISTS `proc_buscar_cita`$$
CREATE PROCEDURE proc_buscar_cita(
    IN v_id_cita VARCHAR(6)
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
        VALUES ('proc_buscar_cita', 'citas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar cita' AS estado;
    END;

    SELECT idcita, fecha_cita, diagnostico, idmedico, idpaciente, idhospital 
    FROM citas 
    WHERE idcita = v_id_cita;

END$$

-- Procedimiento para modificar datos de una cita
DROP PROCEDURE IF EXISTS `proc_actualizar_cita`$$
CREATE PROCEDURE proc_actualizar_cita(
    IN v_id_cita VARCHAR(6),
    IN v_fecha_cita DATE,
    IN v_diagnostico VARCHAR(255),
    IN v_id_medico VARCHAR(6),
    IN v_id_paciente VARCHAR(6),
    IN v_id_hospital VARCHAR(6)
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
        VALUES ('proc_actualizar_cita', 'citas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar cita' AS estado;
    END;

    UPDATE citas 
    SET fecha_cita = v_fecha_cita, 
        diagnostico = v_diagnostico,
        idmedico = v_id_medico,
        idpaciente = v_id_paciente,
        idhospital = v_id_hospital
    WHERE idcita = v_id_cita;
    
    SELECT 'Cita actualizada exitosamente' AS estado;

END$$

-- Procedimiento para eliminar una cita
DROP PROCEDURE IF EXISTS `proc_eliminar_cita`$$
CREATE PROCEDURE proc_eliminar_cita(
    IN v_id_cita VARCHAR(6)
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
        VALUES ('proc_eliminar_cita', 'citas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar cita' AS estado;
    END;

    DELETE FROM citas 
    WHERE idcita = v_id_cita;
    
    SELECT 'Cita eliminada correctamente' AS estado;

END$$

DELIMITER ;
