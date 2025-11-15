Feature: Ver consultas pasadas y recomendaciones
  Como joven adulto
  Quiero ver mis consultas anteriores y acceder a las recomendaciones del dermatólogo
  Para seguir el tratamiento indicado

  Scenario Outline: Listado de consultas previas
    Given que el usuario está en la pantalla de inicio
    When accede a "Consult a dermatologist"
    And selecciona la opción "View past consultations"
    And el sistema carga la lista
    Then se muestran tarjetas con la fecha <fecha>, el dermatólogo <dermatologo> y el estado <estado>
    And el botón "View recommendations" aparece <habilitado>

    Examples:
      | fecha        | dermatologo         | estado     | habilitado             |
      | "2025-01-10" | "Dra. Julia Ramos"  | Completed  | "Habilitado"           |
      | "2025-01-15" | "Dr. Luis Méndez"   | Pending    | "Deshabilitado"        |
      | "2025-01-18" | "Dra. Sakura Ito"   | Cancelled  | "Deshabilitado"        |


  Scenario Outline: Detalle de recomendaciones
    Given que el usuario presiona "View recommendations" en una consulta Completed
    When se abre el detalle
    Then el sistema muestra los productos recomendados <productos>
    And también los hábitos o indicaciones <indicaciones>

    Examples:
      | productos                         | indicaciones                            |
      | "Gel limpiador, Protector solar"  | "Usar SPF diario, evitar exfoliación"   |
      | "Serum de niacinamida"           | "Aplicar por la noche, evitar sol"      |
      | "Crema hidratante"               | "Usar mañana y noche"                   |


  Scenario Outline: Sin consultas registradas
    When accede a "Consult a dermatologist"
    And selecciona la opción "View past consultations"
    And el sistema no encuentra registros de citas anteriores
    Then se muestra el <mensaje>:
      """
      Aún no tienes consultas registradas. Agenda tu primera cita con un dermatólogo para recibir recomendaciones personalizadas.
      """

    Examples:
      | caso                       | mensaje                |
      | "Usuario nuevo"            |Aún no tienes consultas registradas. Agenda tu primera cita con un dermatólogo para recibir recomendaciones personalizadas.|                       |
      | "Historial vacío"          |Aún no tienes consultas registradas. Agenda tu primera cita con un dermatólogo para recibir recomendaciones personalizadas.|

