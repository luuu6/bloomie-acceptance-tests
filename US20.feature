Feature: Consultar diagnósticos previos del paciente
  Como dermatólogo
  Quiero acceder al listado de diagnósticos previos con sus fechas y descripciones
  Para revisar la evolución clínica del paciente y validar los tratamientos prescritos anteriormente


  Scenario: Visualización de diagnósticos previos
    Given que el dermatólogo se encuentra en la sección "Previous diagnoses"
    And existen <diagnsticos> guardados en el historial del paciente
    When accede a la vista
    Then el sistema muestra los <datos registrados> tarjetas con el título del diagnóstico, fecha, número de archivos adjuntos y una nota breve
    And cada tarjeta tiene el botón "View details" que permite acceder a la descripción completa

    Examples:
      | Diagnósticos | datos regitrados de la tarjeta                                      | Botón disponible |
      | Disponible | Título, fecha, archivos adjuntos, nota breve                         | "View details"   |


  Scenario: Detalle del diagnóstico
    Given que el dermatólogo selecciona "View details" en un diagnóstico específico
    When se abre la pantalla "Diagnosis detail"
    Then el sistema muestra la información clínica completa

    Examples:
      | Acción                    | Pantalla mostrada        | Información visible                         |
      | Abrir un diagnóstico      | "Diagnosis detail"       | Datos completos del diagnóstico seleccionado |
