/**
* Presenta un elemento el la posición que se le indica
* @param Event e Evento que genero la acción
* @param string sel Selector del tipo css
*/
function posElem(target, sel) {

    var elem = $(target);
    var pos = elem.position();
    var ew = elem.outerWidth();
    var eh = elem.outerHeight();
    var height = $(sel).outerHeight();
    var width = $(sel).outerWidth();
    var tX = pos.left;
    var tY = height + pos.top - eh + 2;
    var pX = window.innerWidth + window.scrollX;
    var pY = window.innerHeight + window.scrollY;

    // Posicionar abajo o arriba
    if(pX < (tX + width)) {
        tX = pos.left - ((3/2) * ew + 5);
    }
    if(pY < (tY + eh + 10)) {
        tY = pos.top - (height + 4);
    }
    $(sel).css({
        left: tX+'px',
        top: tY+'px'
    });
}

jQuery(document).ready(function(){
    (function($){
        $('.error').live("mouseover", function(e){
            var target = e.target || e.srcElement;
            $('#error-msg div.msg').html($(target).attr('error') );
            $('#error-msg').show();
            posElem(target, '#error-msg');
        }).live("mouseout", function(e){
            $('#error-msg').hide();
        });
    })(jQuery);
});

// // Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/*
 * Extension para date
 */
/**
 * devuelve el ultimo día del mes
 * @param string || object Fecha
 * @param boolean retStr Indica si se retorna un string u objeto
 */
Date.prototype.finDeMes = function(date, retStr) {
    if(retStr === false)
        retStr = false;
    else
        retStr = true;
    
    date = date || this;
    if(typeof(date) == "string") {
        dateF = date.split("-");
        m = dateF[1];
        y = dateF[2];
        dateFin = new Date(y, m, 0);
    }else if(typeof(date) == "object") {
        m = date.getMonth() + 1;
        dateFin = new Date(date.getFullYear(), m, 0 );
    }

    if(retStr) {
        return dateFin.toStr();
    }else {
        return dateFin;
    }
}
/**
 * Retorna la fecha en formato de string
 */
Date.prototype.toStr = function(dateFin) {
    dateFin = dateFin || this;
    d = dateFin.getDate();
    if(d < 10)
        d = "0" + d;
    m = dateFin.getMonth() + 1;
    if(m < 10)
        m = "0" + m;
    return d + "-" + m  +  "-" + dateFin.getFullYear();
}
/**
 * Retorna el inicio de mes
 * @param (string || object) date Fecha
 * @param boolean retStr Indica si se retorna un string u objeto
 */
Date.prototype.inicioDeMes = function(date, retStr) {
    if(retStr === false)
        retStr = false;
    else
        retStr = true;

    date = date || this;
    if(typeof(date) == "string") {
        dateF = date.split("-");
        m = parseInt(dateF[1]) - 1;
        y = dateF[2];
        date = new Date(y, m, 1 );
    }else if(typeof(date) == "object") {
        date = new Date(date.getFullYear(), date.getMonth(), 1 );
    }
    

    date = date || this;
    if(typeof(date) == "string") {
        dateF = date.split("-");
        m = parseInt(dateF[1]) - 1;
        y = dateF[2];
        date = new Date(y, m, 1 );
    }else if(typeof(date) == "object") {
        date = new Date(date.getFullYear(), date.getMonth(), 1 );
    }

    if(retStr) {
        return this.toStr(date);
    }else {
        return date;
    }
}
/**
 * Retorna la la fecha en un formato para Base de Datos
 * @param String | Object fecha
 * @return String
 */
Date.prototype.toDB = function(date) {
    date = date || new Date();

    if(typeof(date) == "string") {
        return date.replace(/(\d\d)-(\d\d)-(\d{4})/, "$3-$2-$1");
    }else{
        var m = date.getMonth() + 1;
        m = m < 10 ? "0" + m : m;
        return date.getFullYear() + "-" + m + "-" + date.getDate();
    }
}

/**
 * Retorna la la fecha en un formato para Base de Datos
 * @return String
 */
String.prototype.toDB = function() {
    return new Date().toDB(this.toString());
}

$(document).ready(function(){
  //$("a:contains(borrar)").each(function(index, el){
    //$($(el).parents("tr")[0]).click(function(){ $(this).addClass("rowdel") } );
  //});

  // Parametros para grider
  Grider = {
    defaults : {
      initCalc: true,
      addRow: true,
      addRowWithTab: true,
      delRow: true,
      decimals: 2,
      addRowText: '<caption><a href="#">Adicionar Fila</a></caption>',
      delRowText: '<td><a href="#" class="delete">borrar</a></td>',
      countRow: false,
      countRowCol: 0,
      countRowText: 'Nº',
      countRowAdd: false,
      addedRow: false,
      rails: true
    }
  };
});
