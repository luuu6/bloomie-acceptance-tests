Feature: Diagnostico preliminar autocompletado

    Como joven adulto
    quiero recibir un reporte preliminar generado por la inteligencia artificial 
    después del escaneo facial 
    para conocer el estado de mi piel y entender qué tipo de cuidados necesito.

Background: 
    Given que el usuario completó el escaneo facial exitosamente
    And la IA recibió las <imagenes> capturadas

Scenario Outline: Diagnostico procesado correctamente
    When el sistema analiza los patrones cutáneos detectados
    Then identifica posibles condiciones como acné, manchas o resequedad
    And muestra un <reporte preliminar> con <nivel de confianza>, <resumen visual> y <recomendaciones iniciales>

Example: Datos de entrada 
    | captura de imagen | captura de imagen |
    |img/lado_derecho_rostro.png | img/lado_izquierdo_rostro.png |

Example: Datos de salida (reporte preliminar)
    | nivel de confianza | resumen visual | recomendaciones iniciales |
    | 0,00001% nivel de error en los resultados | img/analisis_acne.png | utilizar cremas hidratantes diariamente |

Scenario Outline:  Error de procesamiento interno o conexión
    Given que el usuario completó el escaneo facial
    When la IA no puede procesar las <imagenes> por error técnico o de conexión
    Then el sistema muestra el <mensaje> "No se pudo generar el diagnóstico en este momento.
    Intenta nuevamente más tarde."
    And guarda temporalmente las imágenes para reanudar el análisis automáticamente cuando 
    la conexión se restablezca.

Example: Datos de entrada 
    | captura de imagen | captura de imagen |
    |img/lado_derecho_rostro.png | img/lado_izquierdo_rostro.png |

Example: Datos de salida (reporte preliminar)
    | mensaje |
    | No se pudo generar el diagnóstico en este momento. Intenta nuevamente más tarde |

