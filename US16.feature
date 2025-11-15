Feature: Registro de dermatólogo
  Como dermatólogo
  Quiero registrar mis credenciales profesionales en la plataforma
  Para acceder a las funciones exclusivas destinadas a especialistas verificados


  Scenario Outline: Registro exitoso con credenciales válidas
    Given que el dermatólogo se encuentra en la sección "Registro profesional"
    And carga el número de colegiatura <colegiatura> y los documentos requeridos <documentos>
    When presiona el botón "Enviar"
    Then el sistema valida los datos con la base profesional
    And muestra el mensaje "Cuenta validada como especialista. Acceso habilitado a funciones médicas."

    Examples:
      | colegiatura | documentos                                 |
      | "CMP-45231" | "certificacion.pdf, dni_frontal.png"       |
      | "CMP-80122" | "cert_dermatologia.pdf, dni_completo.jpg"  |


  Scenario Outline: Credenciales inválidas o documentos incorrectos
    Given que el dermatólogo ingresa el número de colegiatura <colegiatura>
    And adjunta los documentos <documentos>
    When presiona "Enviar"
    And el sistema detecta que el número de colegiatura no está registrado o los archivos son inválidos
    Then se muestra el <mensaje>
      """
      No se ha podido validar tu registro. Revisa los datos ingresados o contacta soporte.
      """

    Examples:
      | colegiatura | documentos                                 |  mensaje                                                                              |       
      | "CMP-99999" | "archivo_incompleto.pdf"                   |No se ha podido validar tu registro. Revisa los datos ingresados o contacta soporte.   |
      | "CMP-12345" | "imagen_borrosa.png, documento_erroneo.pdf"|No se ha podido validar tu registro. Revisa los datos ingresados o contacta soporte.    |


  Scenario Outline: Validación pendiente por revisión manual
    Given que el dermatólogo ha enviado correctamente su solicitud de registro
    When el sistema requiere validación adicional por parte del equipo de Bloomie
    Then se muestra el mensaje:
      """
      Tu cuenta está en proceso de verificación. Recibirás una notificación cuando la validación sea completada.
      """
    And el acceso a funciones especializadas permanecerá restringido hasta la aprobación final

    Examples:
      | caso                               | mensaje 
      | "Documentos correctos pero dudosos"|Tu cuenta está en proceso de verificación. Recibirás una notificación cuando la validación sea completada.            |
      | "Revisión manual obligatoria"      |Tu cuenta está en proceso de verificación. Recibirás una notificación cuando la validación sea completada.            |
