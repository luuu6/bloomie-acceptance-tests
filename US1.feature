Feature: Registro basico

    Como joven adulto
    quiero registrarme con mis datos personales 
    para crear una cuenta y acceder a Bloomie

Background: 
    Given que el <usuario> está en la pantalla de registro
    And completa los campos de <nombre>,<correo>,<contrasenia>
    And confirma la <contrasenia>


Scenario Outline: Registro exitoso
    When presiona "Registrar"
    Then el sistema valida los datos
    And crea la cuenta mostrando el <mensaje> "Registro exitoso".

Example: Datos de entrada
    | usuario | nombre | correo | contrasenia | contrasenia |
    | Georgina_18 | Georgina Rojas | gergR@gmail.com | perrito1234 | perrito1234 |

Example: Datos de salida 
    | mensaje |
    | Registro exitoso |

Scenario Outline: Campos invalidos 
    Given que el <usuario> está en la pantalla de registro
    And ingresa un <correo> invalido o deja campos vacios
    When presiona "Registrar"
    Then el sistema muestra <mensajes> de error específicos en cada campo inválido.

Example: Datos de entrada
    | usuario | nombre | correo | contrasenia | contrasenia |
    | Georgina_18 | Georgina Rojas | gergR@gmnjnl.com |   | perrito1234 |
 
Example: Datos de salida 
    | mensaje | mensaje |
    | correo invalido | campo obligatorio |
