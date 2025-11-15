Feature: Reporte para dermatólogos
  Como dermatólogo
  Quiero visualizar una lista de mis pacientes recientes
  Para acceder rápidamente a sus historiales, diagnósticos y planes de tratamiento


  Scenario Outline: Visualización de pacientes
    Given que el dermatólogo accede a "Patient interactions"
    When selecciona al paciente <paciente>
    Then el sistema muestra la ficha médica con los datos <datos>, análisis previos <analisis> y recomendaciones "<recomendaciones>"

    Examples:
      | paciente          | datos                               | analisis                               | recomendaciones                             |
      | "Ana Torres"      | "Edad 23, piel sensible"             | "Evaluación del 12/01: leve irritación" | "Evitar exfoliantes fuertes, usar hidratante"|
      | "Luis Ramírez"    | "Edad 28, piel mixta"                | "Diagnóstico del 05/02: acné leve"      | "Rutina AM/PM con niacinamida"              |
      | "María López"     | "Edad 19, piel grasa"                | "Control del 20/02: sebo elevado"       | "Gel limpiador + protector solar"           |


  Scenario Outline: Lista vacía
    Given que el dermatólogo no tiene pacientes asignados
    When ingresa a "Patient interactions"
    Then se muestra el mensaje:
      """
      Aún no tienes pacientes registrados. Las consultas aparecerán aquí.
      """

    Examples:
      | caso                         | mensaje                                                                     |
      | "Cuenta nueva sin pacientes" | Aún no tienes pacientes registrados. Las consultas aparecerán aquí.         |
      | "Sin historial de consultas" | Aún no tienes pacientes registrados. Las consultas aparecerán aquí.         |
