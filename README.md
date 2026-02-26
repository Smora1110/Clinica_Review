# Clínica Universitaria - Base de Datos
Sebastian Andres Mora
## Descripción

Proyecto de base de datos para un sistema de gestión clínica universitaria, desarrollado en MySQL con prácticas de modelado, seguridad y optimización.

## Modelo de Datos

Entidades principales: pacientes, médicos, facultades, especialidades, hospitales, citas, recetas.

## Características

- **Normalización**: Hasta 4FN
- **Procedimientos CRUD**: Para todas las entidades
- **Funciones**: Contar médicos por especialidad, pacientes por médico, pacientes por sede
- **Triggers**: Validación de pacientes y fechas de citas
- **Eventos**: Generación automática de informes diarios
- **Vistas**: Información de médicos y pacientes por medicamento
- **Particionamiento**: Tablas citas, recetas y log_errores
- **Seguridad**: Usuarios y permisos con principio de menor privilegio
- **Protección**: Prepared Statements contra inyección SQL

## Estructura de Archivos

- `modelo_fisico.sql` - Creación de tablas
- `funciones.sql` - Funciones almacenadas
- `CRUD/` - Procedimientos CRUD por entidad
- `triggers_eventos.sql` - Triggers y eventos
- `vistas_particiones.sql` - Vistas y particiones
- `usuarios_permisos.sql` - Gestión de usuarios
- `inserts.sql` - Datos de prueba

## Usuarios del Sistema

| Usuario | Rol |
|---------|-----|
| admin_clinica | Administrador total |
| recepcion | Gestión de pacientes y citas |
| medico_user | Consulta y recetas |
| farmacia_user | Gestión de medicamentos |
| direccion_user | Solo lectura |
| auditor_user | Auditoría de errores |
| app_backend | Ejecución de procedimientos
