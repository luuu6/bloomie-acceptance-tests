Feature: Visualizar fotos adjuntadas del paciente
  Como dermatólogo
  Quiero acceder a las fotografías clínicas registradas en cada consulta
  Para analizar la evolución de la piel del paciente entre distintas fechas y registrar evidencia del progreso del tratamiento


  Scenario: Visualización de fotos disponibles
    Given que el dermatólogo accede a la sección "Attached photos" desde el historial médico del paciente
    And existen fotos previamente registradas en diferentes consultas
    When selecciona una fecha específica o elige "First consultation" o "Last consultation"
    Then el sistema muestra una <galeria> con miniaturas, fechas y <notas> descriptivas
    And cada imagen tiene un <boton> "View full photo" para visualizarla en tamaño completo

    Examples:
      | Opción seleccionada   | Fotos disponibles | Galería visible | Notas incluidas | Botón ver foto completa |
      | Fecha específica      | Sí                | Sí              | Sí              | Sí                      |
      | First consultation    | Sí                | Sí              | Sí              | Sí                      |
      | Last consultation     | Sí                | Sí              | Sí              | Sí                      |


  Scenario: Sin fotos registradas
    Given que el dermatólogo accede a la sección "Attached photos"
    And no hay imágenes cargadas para esa sesión
    When se carga la vista
    Then se muestra el <mensaje> "No photos available yet. Add a new one to start tracking progress."
    And se habilita el botón "+ Upload new photo"

    Examples:
      | Fotos disponibles | Mensaje mostrado                                                            | Botón de subida |
      | No                | "No photos available yet. Add a new one to start tracking progress."        | Habilitado      |


  Scenario: Subida de nueva foto
    Given que el dermatólogo se encuentra en la galería del paciente
    And desea añadir una nueva evidencia visual
    When presiona "+ Upload new photo" y selecciona una imagen desde su dispositivo
    Then el sistema muestra una <barra de progreso> durante la carga
    And al completarse añade la nueva <miniatura> con la fecha actual
    And muestra el <mensaje> "Photo added successfully."

    Examples:
      | Acción               | Barra de progreso | Miniatura añadida      | Mensaje de confirmación         |
      | Subir nueva foto     | Mostrada          | Sí, con fecha actual   | "Photo added successfully."      |
