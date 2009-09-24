Caracteristica:
  Para poder completar el sistema
  hay que realizar la reduccion de 
  inventarios, controlando de que
  no se exeda las cantidades disponibles en
  el inventario

  Escenario: Completar solicitud
    Dado que tengo los items
      |nombre   |unidad_medida_id  |partida_id |codigo   |
      |lapiz hb |1                    |1          |lp1      |
      |papel bond |1                  |2          |pplb      |
      |puntabloa azul |1              |2          |paz      |
      |gomas    |1                    |1          |gom      |
      |carpicola |2                    |1          |car      |
      |cds      |1                    |2          |cd      |
    
    Dado que tendo los siguientes usuarios
      |nombre |paterno  |materno  |rol_id |unidad_id |cargo |login  |password |password_confirmation|ci       |
      |Juan   |Perez    |Cam      |1      |1          |almacen|juan |juan123  |juan123              |21341341|
    
    Dado el stock
      |almacen_id |item_id|cantidad |valor_inventario  |activo |
      |1          |1      |10       |25                |1      |

    Dado la solicitud
      |fecha      |estado   | descripcion   |
      |2009-09-01 |1        |Prueba         |
    
    Dado el detalle de la solicitud
      |solicitud_id |item_id  |cantidad |
      |1            |1        |10       |
      |1            |2        |15       |
