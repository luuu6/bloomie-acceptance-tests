Feature: Explorar productos en tendencia
  Como joven adulto
  Quiero ver productos en tendencia con su imagen y descripción general
  Para descubrir nuevas opciones de skincare acordes al mercado actual


  Scenario Outline: Visualización de productos en tendencia
    Given que el usuario se encuentra en la pantalla de inicio
    When accede a la sección "Trending Items"
    Then el sistema muestra una cuadrícula de productos con imagen <imagen>, nombre <nombre>, marca <marca> y categoría <categoria>

    Examples:
      | imagen                     | nombre                       | marca         | categoria     |
      | "img/cleanser01.png"      | "Gentle Skin Cleanser"       | "CeraVe"      | "Limpiador"   |
      | "img/hydrator02.png"      | "Hydro Boost Gel Cream"      | "Neutrogena"  | "Hidratante"  |
      | "img/serum03.png"         | "Niacinamide 10% + Zinc 1%"  | "The Ordinary"| "Serum"       |


  Scenario Outline: Búsqueda dentro de productos en tendencia
    Given que el usuario está en la sección "Trending Items"
    When escribe la palabra clave <keyword> en la barra de búsqueda
    Then el sistema filtra los productos y muestra solo aquellos que coincidan con "<keyword>"
    And si no se encuentran coincidencias, muestra el mensaje:
      """
      No hay resultados para tu búsqueda. Intenta con otro término.
      """

    Examples:
      | keyword       | mensaje                                                         |
      | "hidratante"  | No hay resultados para tu búsqueda. Intenta con otro término.  |
      | "acné"        | No hay resultados para tu búsqueda. Intenta con otro término.   |
      | "protector"   | No hay resultados para tu búsqueda. Intenta con otro término.   |
