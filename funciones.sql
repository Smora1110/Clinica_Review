-- =====================================================
-- Funciones adicionales para la Clínica Universitaria
-- =====================================================

DELIMITER $$

-- Función para obtener el número de doctores por especialidad
DROP FUNCTION IF EXISTS `fn_contar_medicos_especialidad`$$
CREATE FUNCTION fn_contar_medicos_especialidad(p_idespecialidad VARCHAR(6))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_cantidad INT DEFAULT 0;
    DECLARE v_codigo VARCHAR(10);
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = RETURNED_SQLSTATE,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('fn_contar_medicos_especialidad', 'medicos', v_codigo, v_mensaje);
        RETURN NULL;
    END;

    SELECT COUNT(*) INTO v_cantidad 
    FROM medicos 
    WHERE idespecialidad = p_idespecialidad;
    
    RETURN v_cantidad;

END$$

-- Función para obtener el total de pacientes atendidos por un médico
DROP FUNCTION IF EXISTS `fn_total_pacientes_medico`$$
CREATE FUNCTION fn_total_pacientes_medico(p_idmedico VARCHAR(6))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_cantidad INT DEFAULT 0;
    DECLARE v_codigo VARCHAR(10);
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = RETURNED_SQLSTATE,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('fn_total_pacientes_medico', 'citas', v_codigo, v_mensaje);
        RETURN NULL;
    END;

    SELECT COUNT(DISTINCT idpaciente) INTO v_cantidad 
    FROM citas 
    WHERE idmedico = p_idmedico;
    
    RETURN v_cantidad;

END$$

-- Función para obtener la cantidad de pacientes atendidos en una sede (hospital)
DROP FUNCTION IF EXISTS `fn_pacientes_sede`$$
CREATE FUNCTION fn_pacientes_sede(p_idhospital VARCHAR(6))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_cantidad INT DEFAULT 0;
    DECLARE v_codigo VARCHAR(10);
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = RETURNED_SQLSTATE,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO logs_errores(nombre_procedimiento, nombre_tabla, codigo_error, mensaje_error) 
        VALUES ('fn_pacientes_sede', 'citas', v_codigo, v_mensaje);
        RETURN NULL;
    END;

    SELECT COUNT(DISTINCT idpaciente) INTO v_cantidad 
    FROM citas 
    WHERE idhospital = p_idhospital;
    
    RETURN v_cantidad;

END$$

DELIMITER ;
