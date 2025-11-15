Feature: Seleccionar fecha y hora de cita
  Como joven adulto
  Quiero agendar una cita con un dermatólogo seleccionando la fecha y hora disponibles
  Para recibir atención profesional de forma rápida y organizada

  Scenario Outline: Selección de fecha y horario válidos
    Given que el usuario seleccionó un dermatólogo
    When el sistema muestra el mini calendario con los días disponibles resaltados
    And el usuario selecciona la fecha válida <fecha>
    Then el sistema muestra los botones con horarios disponibles para <fecha>
    And al elegir el <horario>, se habilita el botón "Confirm appointment"

    Examples:
      | fecha         | horario  |
      | "2025-01-16"  | "09:00"  |
      | "2025-01-18"  | "14:30"  |
      | "2025-01-20"  | "17:15"  |


  Scenario Outline: Confirmación de cita
    Given que el usuario seleccionó la fecha <fecha> y el horario <horario>
    And ingresó notas opcionales <notas>
    When presiona el botón "Confirm appointment"
    Then el sistema agenda la cita
    And muestra el <mensaje> "Your appointment has been scheduled successfully."
    And registra la cita con estado "Scheduled"

    Examples:
      | fecha         | horario | notas                         | mensaje                                            |
      | "2025-01-16"  | "09:00" | "Recordar mencionar alergias" | "Your appointment has been scheduled successfully."|
      | "2025-01-18"  | "14:30" | ""                            | "Your appointment has been scheduled successfully."|
      | "2025-01-20"  | "17:15" | "Consulta sobre tratamiento"  |"Your appointment has been scheduled successfully." |
