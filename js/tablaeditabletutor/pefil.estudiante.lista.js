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
var editableGrid = new EditableGrid("listaestudiantes"+time, {
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
	return "../../images/icons/" + relativePath;
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
EditableGrid.prototype.initializeGrid = function() 
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
		cell.innerHTML = "<a onclick=document.location.href='revision.lista.php?id_estudiante=" + getRowId(cell.rowIndex) + "' style=\"cursor:pointer\">" +
		"<img src=\"" + image("seguimiento.png") + "\" border=\"0\" alt=\"seguimiento\" title=\"Seguimiento de Proyecto\" width='30px' height='30px' />Seguimiento</a>";
             //    alert();
              // if( pendiente(getRowId(cell.rowIndex),dicta)==1)
                {
                  cell.innerHTML += "<br> <div  id='clave"+getRowId(cell.rowIndex)+"'>"+pendiente(getRowId(cell.rowIndex))+"</div>";
                }
                  }}));
		
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

EditableGrid.prototype.onloadXML = function(url) 
{
	// register the function that will be called when the XML has been fully loaded
	this.tableLoaded = function() { 
		displayMessage("N&uacute;mero de Estudiantes Inscritos " + this.getRowCount()); 
		this.initializeGrid();
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
	var link = $("<a>").html("<img src='" + image("gofirst.png") + "'/>&nbsp;");
	if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.firstPage(); });
	paginator.append(link);

	// "prev" link
	link = $("<a>").html("<img src='" + image("prev.png") + "'/>&nbsp;");
	if (!this.canGoBack()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.prevPage(); });
	paginator.append(link);

	// pages
	for (p = 0; p < pages.length; p++) paginator.append(pages[p]).append(" | ");
	
	// "next" link
	link = $("<a>").html("<img src='" + image("next.png") + "'/>&nbsp;");
	if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.nextPage(); });
	paginator.append(link);

	// "last" link
	link = $("<a>").html("<img src='" + image("golast.png") + "'/>&nbsp;");
	if (!this.canGoForward()) link.css({ opacity : 0.4, filter: "alpha(opacity=40)" });
	else link.css("cursor", "pointer").click(function(event) { editableGrid.lastPage(); });
	paginator.append(link);
};

function sessionSeguimiento(seccion) {
	$.ajax({ 
		url: '../variable.session.php',
		type: 'POST',
		dataType: "html",
		data: { 
			estudiante_id : seccion
		},
		success: function (response) 
		{ 
                    if(response=="ok"){
                        document.location.href='../revision/revision.lista.php';
                    }else{
                       alert("Intente De Nuevo");
                    }
		},
		error: function() { alert("Ajax failure\n"); },
		async: true
	});
};
function sessionCorreccion(seccion) {
	$.ajax({ 
		url: '../variable.session.php',
		type: 'POST',
		dataType: "html",
		data: { 
			estudiante_id : seccion
		},
		success: function (response) 
		{ 
                    if(response=="ok"){
                        document.location.href='../revision/revision.corregido.lista.php';
                    }else{
                       alert("Intente De Nuevo");
                    }
		},
		error: function() { alert("Ajax failure\n"); },
		async: true
	});
};

function pendiente(estid) {
    var retorno=0;
	$.ajax({ 
		url: '../tutor/pendiente.php',
		type: 'POST',
		dataType: "html",
		data: { 
			estudiante_id : estid
                     
		},
		success: function (response) 
		{ 
         
                  if(response==1)
                  {
                 
                  $('#clave'+estid).html("<a   onclick=document.location.href='perfil.vistobueno.php?id_estudiante="+estid+"' style=\"cursor:pointer\">" +"<img src=\"" + image("basicset/ok.png") + "\" border=\"0\" alt=\"evaluar\" title=\"Visto Bueno\" width='30px' height='30px' />Dar Visto Bueno</a>");    
                  }else
                  {
                     //  
                                           $('#clave'+estid).html("<a    style=\"cursor:pointer\">" +"<img src=\"" + image("basicset/menos.png") + "\" border=\"0\" alt=\"evaluar\" title=\"Visto Bueno\" width='30px' height='30px' />No cumple la cantidad mínima de avances</a>");  
     
                  }
             
		}
	});
       // alert(retorno);
        return retorno;
};
function sessionEvaluacion(seccion) {
	$.ajax({ 
		url: '../variable.session.php',
		type: 'POST',
		dataType: "html",
		data: { 
			estudiante_id : seccion
		},
		success: function (response) 
		{ 
                    if(response=="ok"){
                        document.location.href='../evaluacion/proyecto.evaluacion.php';
                    }else{
                       alert("Intente De Nuevo");
                    }
		},
		error: function() { alert("Ajax failure\n"); },
		async: true
	});
};
