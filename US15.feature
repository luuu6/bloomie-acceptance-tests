Feature: Compatibilidad y recomendación personalizada de producto
  Como joven adulto
  Quiero seleccionar un producto en tendencia y ver si es compatible con mi tipo de piel
  Para tomar decisiones seguras sobre mi compra

  Background:
    Given que el usuario se encuentra en la sección "Trending Items"


  Scenario Outline: Producto compatible con mi tipo de piel
    Given que el usuario tiene un diagnóstico registrado
    And selecciona el producto <producto>
    When el sistema analiza los ingredientes del producto
    Then muestra la etiqueta "Recomendado para tu tipo de piel"
    And detalla los beneficios principales <beneficios> y el nivel de compatibilidad <compatibilidad>

    Examples:
      | producto                       | beneficios                                 | compatibilidad  |
      | "Gel limpiador suave"          | "Reduce irritación, limpia sin resecar"    | "Alta"          |
      | "Hidratante sin fragancia"     | "Retiene hidratación, protege la barrera"  | "Media-Alta"    |
      | "Serum con niacinamida"        | "Controla sebo, mejora textura"            | "Alta"          |


  Scenario Outline: Producto no recomendado o con precauciones
    Given que el usuario selecciona el producto <producto>
    When el sistema detecta ingredientes no compatibles con su tipo de piel
    Then muestra la etiqueta "No recomendado para tu tipo de piel"
    And ofrece una breve explicación <explicacion>
    And sugiere alternativas seguras como <alternativa>

    Examples:
      | producto                      | explicacion                                                              | alternativa                        |
      | "Tónico con alcohol"          | "Contiene alcohol que puede irritar la piel sensible"                    | "Tónico sin alcohol"               |
      | "Crema perfumada"             | "Contiene fragancias que pueden causar irritación o alergias"            | "Crema hipoalergénica"             |
      | "Serum exfoliante fuerte"     | "Alta concentración de ácidos no apta para piel sensible"                | "Serum exfoliante suave"           |
