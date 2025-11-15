Feature: Complementar perfil basico 

    Como joven adulto
    quiero completar un cuestionario inicial de hábitos y condiciones de piel en mi primer ingreso 
    para que la aplicación configure diagnósticos y rutinas personalizadas

Background: 
    Dado que el usuario ha completado su registro o inicio de sesión por primera vez

Scenario Outline: Presentacion del cuestionario en el primer registro
    Cuando el sistema valida sus credenciales
    Entonces muestra la pantalla “Lifestyle Questions” como paso obligatorio 
    antes de continuar con el escaneo facial

Scenario Outline: Completar todas las preguntas del cuestionario
    Given que el usuario está en la pantalla “Lifestyle Questions”
    And selecciona las opciones correspondientes a <consumo de agua>, <exposicion solar> y <horas de suenio>
    (And de forma opcional selecciona su <tipo de piel>)
    When presiona "Continuar"
    Given el sistema guarda las respuestas ingresadas
    And redirige automáticamente a la <pantalla> de preparación para el escaneo facial.

Example: Datos de entrada
    | consumo de agua | exposicion solar | horas de suenio | tipo de piel |
    | 3 - 5 vasos | 30 - 60 minutos | 8 horas | grasosa |

Example: Datos de salida
    | pantalla |
    | escaneo facial |

Scenario Outline: Intentar avanzar sin completar las preguntas obligatorias 
    Given que el usuario está en la pantalla “Lifestyle Questions”
    When intenta presionar "Continuar" sin seleccionar una o más <opciones> requeridas
    Then el sistema resalta en rojo los <campos incompletos>
    And no permite avanzar hasta que se completen.

Example: Datos de entrada 
    | consumo de agua | exposicion solar | horas de suenio | tipo de piel |
    | | | | |

Example:Datos de salida
    |mensaje|
    |campos incompletos|

Scenario Outline: Consulta de ayuda sobre tipo de piel
    Dado que el usuario está en la pantalla “Lifestyle Questions”
    Cuando presiona el <enlace> “Not sure about your skin type?”
    Entonces el sistema despliega una <infografia> con ejemplos visuales y 
    caracteristicas de los diferentes tipos de piel (normal, seca, grasa y mixta)
    Y el usuario puede regresar al cuestionario para 
    continuar su selección o dejar el campo sin responder.

Example: Datos de entrada 
    | enlace |
    | Not sure about your skin type? |

Example:Datos de salida
    | infografia |
    | Caracteristicas de cada tipo de piel|



