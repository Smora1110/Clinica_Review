DELIMITER $$

-- Procedimiento para registrar un nuevo hospital
DROP PROCEDURE IF EXISTS `proc_registrar_hospital`$$
CREATE PROCEDURE proc_registrar_hospital(
    IN v_id_hospital VARCHAR(6),
    IN v_nombre_hospital VARCHAR(45),
    IN v_direccion_hospital VARCHAR(45)
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
        VALUES ('proc_registrar_hospital', 'hospitales', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de hospital' AS estado;
    END;

    INSERT INTO hospitales (idhospital, hospital, direccion) 
    VALUES (v_id_hospital, v_nombre_hospital, v_direccion_hospital);
    SELECT 'Hospital registrado exitosamente' AS estado;

END$$

-- Procedimiento para consultar un hospital específico
DROP PROCEDURE IF EXISTS `proc_buscar_hospital`$$
CREATE PROCEDURE proc_buscar_hospital(
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
        VALUES ('proc_buscar_hospital', 'hospitales', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar hospital' AS estado;
    END;

    SELECT idhospital, hospital, direccion 
    FROM hospitales 
    WHERE idhospital = v_id_hospital;

END$$

-- Procedimiento para modificar datos de un hospital
DROP PROCEDURE IF EXISTS `proc_actualizar_hospital`$$
CREATE PROCEDURE proc_actualizar_hospital(
    IN v_id_hospital VARCHAR(6),
    IN v_nombre_hospital VARCHAR(45),
    IN v_direccion_hospital VARCHAR(45)
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
        VALUES ('proc_actualizar_hospital', 'hospitales', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar hospital' AS estado;
    END;

    UPDATE hospitales 
    SET hospital = v_nombre_hospital, 
        direccion = v_direccion_hospital 
    WHERE idhospital = v_id_hospital;
    
    SELECT 'Hospital actualizado exitosamente' AS estado;

END$$

-- Procedimiento para eliminar un hospital
DROP PROCEDURE IF EXISTS `proc_eliminar_hospital`$$
CREATE PROCEDURE proc_eliminar_hospital(
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
        VALUES ('proc_eliminar_hospital', 'hospitales', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar hospital' AS estado;
    END;

    DELETE FROM hospitales 
    WHERE idhospital = v_id_hospital;
    
    SELECT 'Hospital eliminado correctamente' AS estado;

END$$

DELIMITER ;
