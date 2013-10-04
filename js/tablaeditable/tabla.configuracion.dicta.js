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
var editableGrid = new EditableGrid("configdicta", {
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
EditableGrid.prototype.initializeGrid = function() 
{
	with (this) {
            
                setCellRenderer("action", new CellRenderer({render: function(cell, value) {
		cell.innerHTML = "<a onclick=\"if (confirm('Esta seguro de eliminar esta Materia? ')) {deletete(" + getRowId(cell.rowIndex) + "); updatetable("+cell.rowIndex+");} \" style=\"cursor:pointer\">" +
                                "<img src=\"" + image("icons/borrar.png") + "\" border=\"0\" alt=\"delete\" title=\"Delete Materia\"/>Borrar</a>";
                cell.innerHTML += "<br><a onclick=\"if (confirm('Esta seguro de Editar esta Materia? ')) {editar(" + getRowId(cell.rowIndex) + "); updatetable("+cell.rowIndex+");} \" style=\"cursor:pointer\">" +
                                "<img src=\"" + image("icons/editar.png") + "\" border=\"0\" alt=\"editar\" title=\"Editar Materia\"/>Editar</a>";
		}}));

		// register the function that will handle model changes
		modelChanged = function(rowIndex, columnIndex, oldValue, newValue, row) { 
		};
		
		// update paginator whenever the table is rendered (after a sort, filter, page change, etc.)
		tableRendered = function() { this.updatePaginator(); };


		rowSelected = function(oldRowIndex, newRowIndex) {
			if (oldRowIndex < 0) displayMessage("Selecionada Fila '" + this.getRowId(newRowIndex) + "'");
			else displayMessage("Selecionada Fila y Cambiada por '" + this.getRowId(oldRowIndex) + "' to '" + this.getRowId(newRowIndex) + "'");
		};
		
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
		displayMessage("Numero de Materias del Semestre " + this.getRowCount()); 
		this.initializeGrid();
	};

	// load XML URL
	this.loadXML(url);
};

function actualizar(){
    	// register the function that will be called when the XML has been fully loaded
	editableGrid.tableLoaded = function() { 
		displayMessage("Numero de Materias del Semestre " + editableGrid.getRowCount()); 
		editableGrid.initializeGrid();
	};

	// load XML URL
	editableGrid.loadXML("configuracion.dicta2.php");    
}

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

function deletete(obser){
   ajax=objetoAjax();
   ajax.open("POST", "configuracion.dicta1.php?eliminardicta=1&iddicta="+obser);
   ajax.send(null);
   //actualizar();
};
function updatetable(rowIndex)
{
    editableGrid.remove(rowIndex);
    displayMessage("Numero de Materias del Semestre " + editableGrid.getRowCount());
};
function enviarDatosGrupo(){
  //recogemos los valores de los inputs
  docente_id=document.nueva_grupo.docente_id.value;
  materia_id=document.nueva_grupo.materia_id.value;
  grupo=document.nueva_grupo.grupo.value;
  if(grupo!=''){
        //instanciamos el objetoAjax
  ajax=objetoAjax();
  //uso del medotod POST
  //archivo que realizará la operacion
  ajax.open("POST", "configuracion.dicta1.php?registrardicta=1&docente_id="+docente_id+"&materia_id="+materia_id+"&grupo="+grupo,true);
    //cuando el objeto XMLHttpRequest cambia de estado, la función se inicia
  ajax.onreadystatechange=function() {
	  //la función responseText tiene todos los datos pedidos al servidor
  	if (ajax.readyState==4) {
  		//mostrar resultados en esta capa
                actualizar();
		//llamar a funcion para limpiar los inputs
		LimpiarCampos();
	}
 }
	ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//enviando los valores a registro.php para que inserte los datos
	ajax.send(null);
  }else{
      alert("INTRODUSCA DATOS PARA CREAR GRUPO");
  };

};
 
//función para limpiar los campos
function LimpiarCampos(){
  document.nueva_grupo.grupo.value="";
  document.nueva_grupo.docente_id.value="";
  document.nueva_grupo.materia_id.value="";
  document.nueva_grupo.grupo.focus();
};

function objetoAjax(){
	var xmlhttp=false;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
	try {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	} catch (E) {
		xmlhttp = false;
	}
}
if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
	  xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
};
