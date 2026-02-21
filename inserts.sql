
-- Insertando pacientes
INSERT INTO pacientes (idpaciente, nombre_paciente, apellido_paciente, telefono_paciente) 
VALUES ('PAC-001', 'Carlos', 'Mendoza', 700100);
INSERT INTO pacientes (idpaciente, nombre_paciente, apellido_paciente, telefono_paciente) 
VALUES ('PAC-002', 'Maria', 'Lopez', 700200);
INSERT INTO pacientes (idpaciente, nombre_paciente, apellido_paciente, telefono_paciente) 
VALUES ('PAC-003', 'Pedro', 'Gomez', 700300);

-- Insertando facultades
INSERT INTO facultades (idfacultad, nombre_facultad, decano_facultad) 
VALUES ('FAC-01', 'Medicina General', 'Dra. Martinez');
INSERT INTO facultades (idfacultad, nombre_facultad, decano_facultad) 
VALUES ('FAC-02', 'Ciencias de la Salud', 'Dr. Rodriguez');

-- Insertando especialidades
INSERT INTO especialidades (idespecialidad, especialidad) 
VALUES ('ESP-01', 'Medicina Interna');
INSERT INTO especialidades (idespecialidad, especialidad) 
VALUES ('ESP-02', 'Pediatría');
INSERT INTO especialidades (idespecialidad, especialidad) 
VALUES ('ESP-03', 'Dermatología');

-- Insertando médicos
INSERT INTO medicos (idmedico, nombre_medico, idfacultad, idespecialidad) 
VALUES ('MED-101', 'Dr. Alvarez', 'FAC-01', 'ESP-01');
INSERT INTO medicos (idmedico, nombre_medico, idfacultad, idespecialidad) 
VALUES ('MED-102', 'Dra. Castro', 'FAC-01', 'ESP-02');
INSERT INTO medicos (idmedico, nombre_medico, idfacultad, idespecialidad) 
VALUES ('MED-103', 'Dr. Ramirez', 'FAC-02', 'ESP-03');

-- Insertando hospitales
INSERT INTO hospitales (idhospital, hospital, direccion) 
VALUES ('HSP-001', 'Hospital Central', 'Avenida Principal #25');
INSERT INTO hospitales (idhospital, hospital, direccion) 
VALUES ('HSP-002', 'Clínica San José', 'Boulevard Norte #50');

-- Insertando citas
INSERT INTO citas (idcita, fecha_cita, diagnostico, idmedico, idpaciente, idhospital) 
VALUES ('CIT-001', '2024-06-15', 'Control general', 'MED-101', 'PAC-001', 'HSP-001');
INSERT INTO citas (idcita, fecha_cita, diagnostico, idmedico, idpaciente, idhospital) 
VALUES ('CIT-002', '2024-06-16', 'Alergia estacional', 'MED-101', 'PAC-002', 'HSP-001');
INSERT INTO citas (idcita, fecha_cita, diagnostico, idmedico, idpaciente, idhospital) 
VALUES ('CIT-003', '2024-06-17', 'Chequeo pediátrico', 'MED-102', 'PAC-001', 'HSP-002');
INSERT INTO citas (idcita, fecha_cita, diagnostico, idmedico, idpaciente, idhospital) 
VALUES ('CIT-004', '2024-06-20', 'Erupción cutánea', 'MED-103', 'PAC-003', 'HSP-002');

-- Insertando medicamentos
INSERT INTO medicamentos (idmedicamento, medicamento) 
VALUES ('MEDI-01', 'Acetaminofén');
INSERT INTO medicamentos (idmedicamento, medicamento) 
VALUES ('MEDI-02', 'Naproxeno');
INSERT INTO medicamentos (idmedicamento, medicamento) 
VALUES ('MEDI-03', 'Cetirizina');
INSERT INTO medicamentos (idmedicamento, medicamento) 
VALUES ('MEDI-04', 'Omeprazol');
INSERT INTO medicamentos (idmedicamento, medicamento) 
VALUES ('MEDI-05', 'Loratadina');

-- Insertando recetas
INSERT INTO recetas (idreceta, dosis, idmedicamento, idcita) 
VALUES ('RCP-01', '500mg', 'MEDI-01', 'CIT-001');
INSERT INTO recetas (idreceta, dosis, idmedicamento, idcita) 
VALUES ('RCP-02', '250mg', 'MEDI-02', 'CIT-001');
INSERT INTO recetas (idreceta, dosis, idmedicamento, idcita) 
VALUES ('RCP-03', '10mg', 'MEDI-03', 'CIT-002');
INSERT INTO recetas (idreceta, dosis, idmedicamento, idcita) 
VALUES ('RCP-04', '20mg', 'MEDI-04', 'CIT-003');
INSERT INTO recetas (idreceta, dosis, idmedicamento, idcita) 
VALUES ('RCP-05', '5mg', 'MEDI-05', 'CIT-004');
