Feature: Chatbot de skincare
  Como joven adulto
  Quiero consultar al chatbot mis dudas sobre rutinas, productos o ingredientes
  Para recibir orientación inmediata

  Background:
    Given que el usuario está autenticado
    And accede a la sección "Chatbot de skincare"

  Scenario Outline: Consulta respondida por el chatbot
    When el usuario escribe una <consulta_valida>
    Then el chatbot responde con información segura sobre <tema>
    And muestra enlaces o consejos asociados como <recomendacion>

    Examples:
      | consulta_valida                                | tema                       | recomendacion                                       |
      | "¿Puedo usar niacinamida con vitamina C?"      | compatibilidad de activos  | "Ver guía de uso combinado de ingredientes"         |
      | "¿Qué rutina básica debo seguir por la mañana?"| rutina de skincare         | "Revisa tu rutina personalizada en la sección Rutinas" |

  Scenario Outline: Consulta no reconocida o sin respuesta
    Given que el usuario está en la sección "Chatbot de skincare"
    When el usuario realiza una <consulta_desconocida>
    Then el chatbot muestra el mensaje "No tengo información sobre eso por ahora"
    And sugiere al usuario agendar una consulta virtual con un dermatólogo

    Examples:
      | consulta_desconocida                         |
      | "¿Cuánto mide la capa córnea en micrómetros?"|
      | "¿El agua micelar sirve para curar acné severo?" |