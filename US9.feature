Feature: Mapa interactivo de farmacias
    Como joven adulto
    quiero ver un mapa con farmacias y tiendas cercanas 
    para saber donde comprar productos recomendados.

Background: 
    Given que el usuario se encuentra en la pantalla de inicio
    And tiene <productos recomendados> en su rutina

Scenario Outline: Visualización de farmacias cercanas
    When ingresa al mapa
    Then el sistema muestra <farmacias> cercanas con disponibilidad y <precios>.

Example: Datos de entrada
    | producto recomendado |
    | Bloqueador Isdin - sin color |

Example: Datos de salida (mapa interactivo)
    | farmacia | direccion | precio |
    | Aruma | Av. La encalada 1456 | 90 soles |

Scenario Outline: Aplicación de filtros en el mapa
    Given que el usuario está en la pantalla del mapa
    When selecciona <filtros de presupuesto> o <marca>
    Then el sistema actualiza la lista de <farmacias> de acuerdo con los filtros aplicados.

Example: Datos de entrada
    | producto recomendado | filtro de precio | filtro de marca |
    | serum de ojos | 40 - 90 soles | Lanaige |

Example: Datos de salida (mapa interactivo)
    | farmacia | direccion | precio |
    | Aruma | Av. La encalada 1456 | 90 soles |

Scenario Outline: Filtros sin coincidencias
    Given que el usuario está en la pantalla del mapa
    When selecciona <filtros de presupuesto> o <marca> que no tienen coincidencias
    Then el sistema muestra el <mensaje> "No se encontraron farmacias con los criterios seleccionados"
    And sugiere quitar o modificar los filtros aplicados.

Example: Datos de entrada
    | producto recomendado | filtro de precio | filtro de marca |
    | Crema limpiadora | 10 soles | Pixi |

Example: Datos de salida (mapa interactivo)
    | mensaje | menssaje |
    | No se encontraron farmacias con los criterios seleccionados | modifica las opciones seleccionadas en el filtro |
