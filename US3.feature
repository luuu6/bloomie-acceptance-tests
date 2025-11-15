Feature: Escaneo facial con camara

    Como joven adulto
    quiero realizar un escaneo facial moviendo mi cabeza frente a la cámara 
    para que la aplicación capture imágenes desde diferentes ángulos 
    y obtenga un diagnóstico preciso de mi tipo de piel

Background:
    Given que el usuario accede a la función de escaneo facial
    And la cámara del dispositivo está activa

Scenario Outline: Escaneo facial completado correctamente
    When gira lentamente su cabeza siguiendo el círculo de guía hasta completarlo
    Then el sistema <captura las imagenes> necesarias desde diferentes ángulos
    And muestra una notificación con el <mensaje> "Escaneo completado con éxito"
    And continúa automáticamente con el proceso de análisis facial

Example: Datos de entrada
    | captura de imagen | captura de imagen |
    | lado derecho del rostro | lado izquierdo del rostro |

Example: Datos de salida
    | mensaje |
    | escaneo completado con exito |

Scenario Outline: Escaneo facial incompleto
    Dado que el usuario inicia el escaneo facial
    Cuando no completa el giro completo del círculo o se detiene antes de finalizar
    Entonces el sistema interrumpe el proceso
    Y muestra una <notificacion> superior con el mensaje "Escaneo incompleto,
    por favor completa el movimiento para continuar"
    Y mantiene la guía visual activa para que el usuario pueda reintentarlo.

Example: Datos de entrada
    | captura de imagen | captura de imagen |
    | | |

Example: Datos de salida
    | mensaje |
    | Escaneo incompleto, por favor completa el movimiento para continuar |