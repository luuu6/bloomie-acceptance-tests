Feature: Listar dermatólogos para agendar
  Como joven adulto
  Quiero ver una lista de dermatólogos con su nombre, foto y costo por consulta
  Para elegir a quién agendar

  Background:
    Given que el usuario está en la pantalla de inicio

  Scenario Outline: Lista de especialistas disponible
    When accede a "Consult a dermatologist"
    And selecciona la opción "Book new appointment"
    Then el sistema carga la lista de dermatólogos
    And muestra la <foto>, el <nombre>, la <especialidad> y el <precio>
    And permite al usuario seleccionar el dermatólogo con <nombre> para reservar consulta

    Examples:
      | foto                     | nombre               | especialidad                | precio     |
      | "img/derm_julia.png"    | "Dra. Julia Ramos"   | "Dermatología general"      | "$50 USD"  |
      | "img/derm_mendez.png"   | "Dr. Luis Méndez"    | "Dermatología estética"     | "$65 USD"  |
      | "img/derm_sakura.png"   | "Dra. Sakura Ito"    | "Dermatología clínica"      | "$70 USD"  |

  Scenario Outline: Sin especialistas disponibles
    Given que el usuario presiona "Book new appointment"
    When no hay especialistas disponibles 
    Then el sistema muestra un <mensaje> "No hay dermatólogos disponibles en este momento. Intenta más tarde."

    Examples:
      | caso                            | mensaje                                                           |
      | "no hay especialistas"          | No hay dermatólogos disponibles en este momento. Intenta más tarde|    
      | "Hay especialistas disponibles" | seleccione el dermatólogo para agendar                            |
