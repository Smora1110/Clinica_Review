
DELIMITER $$

-- Procedimiento para registrar un nuevo medicamento
DROP PROCEDURE IF EXISTS `proc_registrar_medicamento`$$
CREATE PROCEDURE proc_registrar_medicamento(
    IN v_id_medicamento VARCHAR(6),
    IN v_nombre_medicamento VARCHAR(45)
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
        VALUES ('medicamentos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de medicamento' AS estado;
    END;

    INSERT INTO medicamentos (idmedicamento, medicamento) 
    VALUES (v_id_medicamento, v_nombre_medicamento);
    SELECT 'Medicamento registrado exitosamente' AS estado;

END$$

-- Procedimiento para consultar un medicamento específico
DROP PROCEDURE IF EXISTS `proc_buscar_medicamento`$$
CREATE PROCEDURE proc_buscar_medicamento(
    IN v_id_medicamento VARCHAR(6)
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
        VALUES ('medicamentos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar medicamento' AS estado;
    END;

    SELECT idmedicamento, medicamento 
    FROM medicamentos 
    WHERE idmedicamento = v_id_medicamento;

END$$

-- Procedimiento para modificar datos de un medicamento
DROP PROCEDURE IF EXISTS `proc_actualizar_medicamento`$$
CREATE PROCEDURE proc_actualizar_medicamento(
    IN v_id_medicamento VARCHAR(6),
    IN v_nombre_medicamento VARCHAR(45)
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
        VALUES ('medicamentos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar medicamento' AS estado;
    END;

    UPDATE medicamentos 
    SET medicamento = v_nombre_medicamento 
    WHERE idmedicamento = v_id_medicamento;
    
    SELECT 'Medicamento actualizado exitosamente' AS estado;

END$$

-- Procedimiento para eliminar un medicamento
DROP PROCEDURE IF EXISTS `proc_eliminar_medicamento`$$
CREATE PROCEDURE proc_eliminar_medicamento(
    IN v_id_medicamento VARCHAR(6)
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
        VALUES ('medicamentos', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar medicamento' AS estado;
    END;

    DELETE FROM medicamentos 
    WHERE idmedicamento = v_id_medicamento;
    
    SELECT 'Medicamento eliminado correctamente' AS estado;

END$$

DELIMITER ;
