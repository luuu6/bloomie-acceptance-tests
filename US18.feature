Feature: Validación de rutina médica mediante videollamada
  Como dermatólogo
  Quiero mantener una videollamada con mis pacientes desde la aplicación
  Para evaluar su condición de piel en tiempo real y ofrecer recomendaciones inmediatas


  Scenario Outline: Llamada activa
    Given que el dermatólogo inicia la videollamada
    When el paciente acepta la llamada
    Then ambos pueden comunicarse mediante audio y video
    And disponen de las opciones <opciones>

    Examples:
      | opciones                                 |
      | "Finalizar, Silenciar, Más acciones"     |
      | "End call, Mute, More actions"           |


  Scenario Outline: Envío de información durante la llamada
    Given que el dermatólogo está en sesión activa
    When presiona "More actions" y selecciona "Patient interaction"
    Then puede adjuntar <documento> o <recomendacion>
    And el paciente recibe una notificación confirmando el envío

    Examples:
      | documento               | recomendacion                    |
      | "archivo_derma.pdf"     | "Rutina personalizada en PDF"    |
      | "imagen_lesion.png"     | "Indicaciones para cuidados AM"  |


  Scenario Outline: Llamada finalizada
    Given que el dermatólogo presiona "End call"
    Then el sistema muestra el mensaje:
      """
      Llamada finalizada correctamente. ¿Deseas enviar un resumen al paciente?
      """

    Examples:
      | caso                    |
      | "Finalización normal"   |
      | "Paciente cuelga antes" |
