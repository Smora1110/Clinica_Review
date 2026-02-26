-- =====================================================
-- Vistas para la Clínica Universitaria
-- =====================================================

-- Vista 1: Información completa de médicos
CREATE OR REPLACE VIEW vw_medicos_info AS
SELECT 
    m.idmedico,
    m.nombre_medico,
    f.nombre_facultad,
    f.decano_facultad,
    e.especialidad
FROM medicos m
INNER JOIN facultades f ON m.idfacultad = f.idfacultad
INNER JOIN especialidades e ON m.idespecialidad = e.idespecialidad;

-- Vista 2: Pacientes atendidos por medicamento
CREATE OR REPLACE VIEW vw_pacientes_por_medicamento AS
SELECT 
    med.idmedicamento,
    med.medicamento,
    COUNT(DISTINCT c.idpaciente) AS total_pacientes
FROM medicamentos med
INNER JOIN recetas r ON med.idmedicamento = r.idmedicamento
INNER JOIN citas c ON r.idcita = c.idcita
GROUP BY med.idmedicamento, med.medicamento;

-- =====================================================
-- Particionamiento de Tablas
-- =====================================================

-- Particionar tabla citas por año (RANGE)
ALTER TABLE citas
PARTITION BY RANGE (YEAR(fecha_cita)) (
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pFuture VALUES LESS THAN MAXVALUE
);

-- Particionar tabla recetas por HASH
ALTER TABLE recetas
PARTITION BY HASH(idcita)
PARTITIONS 4;

-- Particionar tabla log_errores por año
ALTER TABLE log_errores
PARTITION BY RANGE (YEAR(fecha_hora)) (
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pFuture VALUES LESS THAN MAXVALUE
);
