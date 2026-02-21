DELIMITER $$

-- Procedimiento para registrar una nueva receta
DROP PROCEDURE IF EXISTS `proc_registrar_receta`$$
CREATE PROCEDURE proc_registrar_receta(
    IN v_id_receta VARCHAR(6),
    IN v_dosis VARCHAR(45),
    IN v_id_medicamento VARCHAR(6),
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
        VALUES ('proc_registrar_receta', 'recetas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error en el registro de receta' AS estado;
    END;

    INSERT INTO recetas (idreceta, dosis, idmedicamento, idcita) 
    VALUES (v_id_receta, v_dosis, v_id_medicamento, v_id_cita);
    SELECT 'Receta registrada exitosamente' AS estado;

END$$

-- Procedimiento para consultar una receta específica
DROP PROCEDURE IF EXISTS `proc_buscar_receta`$$
CREATE PROCEDURE proc_buscar_receta(
    IN v_id_receta VARCHAR(6)
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
        VALUES ('proc_buscar_receta', 'recetas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al buscar receta' AS estado;
    END;

    SELECT idreceta, dosis, idmedicamento, idcita 
    FROM recetas 
    WHERE idreceta = v_id_receta;

END$$

-- Procedimiento para modificar datos de una receta
DROP PROCEDURE IF EXISTS `proc_actualizar_receta`$$
CREATE PROCEDURE proc_actualizar_receta(
    IN v_id_receta VARCHAR(6),
    IN v_dosis VARCHAR(45),
    IN v_id_medicamento VARCHAR(6),
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
        VALUES ('proc_actualizar_receta', 'recetas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al actualizar receta' AS estado;
    END;

    UPDATE recetas 
    SET dosis = v_dosis, 
        idmedicamento = v_id_medicamento,
        idcita = v_id_cita
    WHERE idreceta = v_id_receta;
    
    SELECT 'Receta actualizada exitosamente' AS estado;

END$$

-- Procedimiento para eliminar una receta
DROP PROCEDURE IF EXISTS `proc_eliminar_receta`$$
CREATE PROCEDURE proc_eliminar_receta(
    IN v_id_receta VARCHAR(6)
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
        VALUES ('proc_eliminar_receta', 'recetas', lc_codigo_error, lc_descripcion_error);
        SELECT 'Error al eliminar receta' AS estado;
    END;

    DELETE FROM recetas 
    WHERE idreceta = v_id_receta;
    
    SELECT 'Receta eliminada correctamente' AS estado;

END$$

DELIMITER ;
