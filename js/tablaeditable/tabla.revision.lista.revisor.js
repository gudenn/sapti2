/*
 * examples/full/javascript/demo.js
 * 
 * This file is part of EditableGrid.
 * http://editablegrid.net
 *
 * Copyright (c) 2011 Webismymind SPRL
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://editablegrid.net/license
 */

// create our editable grid
var time=Math.random();
var editableGrid = new EditableGrid("listarevisionrevisor"+time, {
	enableSort: true, // true is the default, set it to false if you don't want sorting to be enabled
	editmode: "absolute", // change this to "fixed" to test out editorzone, and to "static" to get the old-school mode
	editorzoneid: "edition", // will be used only if editmode is set to "fixed"
	pageSize: 10
});
// helper function to display a message
function displayMessage(text, style) { 
	_$("message").innerHTML = "<p class='" + (style || "ok") + "'>" + text + "</p>"; 
};

// helper function to get path of a demo image
function image(relativePath) {
	return "../../images/" + relativePath;
};

// this will be used to render our table headers
function InfoHeaderRenderer(message) { 
	this.message = message; 
	this.infoImage = new Image();
	this.infoImage.src = image("information.png");
};

InfoHeaderRenderer.prototype = new CellRenderer();
InfoHeaderRenderer.prototype.render = function(cell, value) 
{
	if (value) {
		// here we don't use cell.innerHTML = "..." in order not to break the sorting header that has been created for us (cf. option enableSort: true)
		var link = document.createElement("a");
		link.href = "javascript:alert('" + this.message + "');";
		link.appendChild(this.infoImage);
		cell.appendChild(document.createTextNode("\u00a0\u00a0"));
		cell.appendChild(link);
	}
};

// this function will initialize our editable grid
EditableGrid.prototype.initializeGrid = function(estid) 
{
	with (this) {
                
		// register the function that will handle model changes
		modelChanged = function(rowIndex, columnIndex, oldValue, newValue, row) { 
		};
		
		// update paginator whenever the table is rendered (after a sort, filter, page change, etc.)
		tableRendered = function() { this.updatePaginator(); };


		rowSelected = function(oldRowIndex, newRowIndex) {
			if (oldRowIndex < 0) displayMessage("Fila Seleccionada '" + this.getRowId(newRowIndex) + "'");
			else displayMessage("Fila Seleccionada y Cambiada por '" + this.getRowId(oldRowIndex) + "' to '" + this.getRowId(newRowIndex) + "'");
		};
                setCellRenderer("action", new CellRenderer({render: function(cell, value) {
                if(getValueAt(cell.rowIndex, '1')=='0'){
                cell.innerHTML = "<a href='#' class='avancedetalle' id="+getRowId(cell.rowIndex)+" style=\"cursor:pointer\">" +
						 "<img src=\"" + image("icons/detalle.png") + "\" border=\"0\" alt=\"detalle\" title=\"Detalle Avance\" />Detalle</a>";
                }
                else if(getValueAt(cell.rowIndex, '1')=='AC'){
                cell.innerHTML = "<a href='#' class='observaciondetalle' id="+getRowId(cell.rowIndex)+" style=\"cursor:pointer\">" +
			 "<img src=\"" + image("icons/detalle.png") + "\" border=\"0\" alt=\"detalle\" title=\"Detalle Revision\"/>Detalle</a>";
                }else{
                cell.innerHTML = "<a href='#' class='avancedetalle' id="+getRowId(cell.rowIndex)+" style=\"cursor:pointer\">" +
						 "<img src=\"" + image("icons/detalle.png") + "\" border=\"0\" alt=\"detalle\" title=\"Detalle Avance\" />Detalle</a>";
                      }
                }}));
                setCellRenderer("num", new CellRenderer({
                    
                    render: function(cell, value) { cell.innerHTML =cortarResumen(extractText(extractText(value)), length = "25", end = "...");}
		}));
            	setCellRenderer("tipo", new CellRenderer({
                    
                    render: function(cell, value) { cell.innerHTML ="<a>"+"<img src='" + image("icons/flags/" + value.toLowerCase() + "r.png") + "' alt='" + value + "' title=\"Tipo de Evento\" width='30px' height='30px'/>"+nombreTipo(value)+"</a>";}
		})); 
            	setCellRenderer("revtipo", new CellRenderer({
                    
                    render: function(cell, value) { cell.innerHTML ="<a>"+"<img src='" + image("icons/flags/" + value.toLowerCase() + ".png") + "' alt='" + value + "' title=\"Tipo de Revisor\" width='30px' height='30px'/>"+nombreRevisor(value)+"</a>";}
		})); 
                setCellRenderer("estado", new CellRenderer({
			render: function(cell, value){ cell.innerHTML ="<a>"+"<img src='" + image("icons/flags/" + value.toLowerCase() + ".png") + "' alt='" + value + "' title=\"Estado de Revicion\" width='30px' height='30px'/>"+estadoRevision(value)+"</a>";} 
		}));
		
		// render the grid (parameters will be ignored if we have attached to an existing HTML table)
		renderGrid("tablecontent", "testgrid", "tableid");
                		
		// set active (stored) filter if any
		_$('filter').value = currentFilter ? currentFilter : '';
		
		// filter when something is typed into filter
		_$('filter').onkeyup = function() { editableGrid.filter(_$('filter').value); };
		
		// bind page size selector
		$("#pagesize").val(pageSize).change(function() { editableGrid.setPageSize($("#pagesize").val()); });
		
	}
};

EditableGrid.prototype.onloadXML = function(url, estid) 
{
	// register the function that will be called when the XML has been fully loaded
	this.tableLoaded = function() { 
		displayMessage("Numero de Avances, Revisiones y Correcciones al Proyecto " + this.getRowCount()); 
		this.initializeGrid(estid);
	};

	// load XML URL
	this.loadXML(url);
};

// function to render the paginator control
EditableGrid.prototype.updatePaginator = function()
{
	var paginator = $("#paginator").empty();
	var nbPages = this.getPageCount();

	// get interval
	var interval = this.getSlidingPageInterval(20);
	if (interval == null) return;
	
	// get pages in interval (with links except for the current page)
	var pages = this.getPagesInInterval(interval, function(pageIndex, isCurrent) {
		if (isCurrent) return "" + (pageIndex + 1);
		return $("<a>").css("cursor", "pointer").html(pageIndex + 1).click(function(event) { editableGrid.setPageIndex(parseInt($(this).html()) - 1); });
	});
		
	// "first" link
	var link = $("<a>").html("<img src='" + image("icons/gofirst.png") + "'/>&nbsp;");
	if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.firstPage(); });
	paginator.append(link);

	// "prev" link
	link = $("<a>").html("<img src='" + image("icons/prev.png") + "'/>&nbsp;");
	if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.prevPage(); });
	paginator.append(link);

	// pages
	for (p = 0; p < pages.length; p++) paginator.append(pages[p]).append(" | ");
	
	// "next" link
	link = $("<a>").html("<img src='" + image("icons/next.png") + "'/>&nbsp;");
	if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.nextPage(); });
	paginator.append(link);

	// "last" link
	link = $("<a>").html("<img src='" + image("icons/golast.png") + "'/>&nbsp;");
	if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.lastPage(); });
	paginator.append(link);
};
function nombreRevisor(tipo){
    nombre='';
    switch (tipo) { 
   	case 'DO': 
            nombre='DOCENTE';
      	 break
         case 'TR': 
             nombre='TRIBUNAL';
      	 break
        case 'DP': 
             nombre='DOCENTE PERFIL';
      	 break 
        case 'TU': 
             nombre='TUTOR';
      	 break
        case '0': 
             nombre='AVANCE';
      	 break
   	default: 
            nombre='USUARIO';
        } 
    return nombre;
}
function nombreTipo(tipo){
    nombre='';
        switch (tipo) { 
   	case 'AC': 
            nombre='REVISION';
      	 break
   	case '0': 
            nombre='AVANCE';
      	 break
   	case 'CO': 
            nombre='CORRECCION';
      	 break
   	case 'VI': 
            nombre='CORRECCION';
      	 break
        default: 
            nombre='ARCHIVO';
        }
    return nombre;
}
function estadoRevision(tipo){
    nombre='';
            switch (tipo) { 
   	case 'CR': 
            nombre='Creado';
      	 break
   	case 'VI': 
            nombre='Visto';
      	 break
   	case 'RE': 
            nombre='Respondido';
      	 break
   	case 'AP': 
            nombre='Aprobado';
      	 break
   	case 'CO': 
            nombre='Revisado';
      	 break
        default: 
            nombre='Visto';

    }
    return nombre;
}
function cortarResumen (texto, length, end){
    if(!parseInt(texto))
  return texto.substring(0, length) + end;
  return texto;
};

function extractText(anchText){
    var str1 = document.createElement('str1');      
    str1.innerHTML = anchText;
    return str1.innerText;
}