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
var editableGrid = new EditableGrid("evaluacion1", {
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

		// add a cell validator to check that the age is in [15, 100[
		addCellValidator("evaluacion_2", new CellValidator({ 
			isValid: function(value) { return value == "" || (parseInt(value) >=0 && parseInt(value) <= 100); }
		}));
		addCellValidator("evaluacion_3", new CellValidator({ 
			isValid: function(value) { return value == "" || (parseInt(value) >=0 && parseInt(value) <= 100); }
		}));
		addCellValidator("evaluacion_1", new CellValidator({ 
			isValid: function(value) { return value == "" || (parseInt(value) >=0 && parseInt(value) <= 100); }
		}));
		
		// register the function that will handle model changes
		modelChanged = function(rowIndex, columnIndex, oldValue, newValue, row) { 
                               updateCellValue(this, rowIndex, columnIndex, oldValue, newValue, row);
		};
		
		// update paginator whenever the table is rendered (after a sort, filter, page change, etc.)
		tableRendered = function() { this.updatePaginator(); };


		rowSelected = function(oldRowIndex, newRowIndex) {
			if (oldRowIndex < 0) displayMessage("Selecionada Fila '" + this.getRowId(newRowIndex) + "'");
			else displayMessage("Selecionada Fila y Cambiada por '" + this.getRowId(oldRowIndex) + "' to '" + this.getRowId(newRowIndex) + "'");
		};
                
                setCellRenderer("action", new CellRenderer({render: function(cell, value) {
		cell.innerHTML = "<a href='#' class='historial' id="+getRowId(cell.rowIndex)+" style=\"cursor:pointer\">" +
						 "<img src=\"" + image("basicset/graph.png") + "\" border=\"0\" alt=\"historial\" title=\"Seguimiento\" width='40px' height='40px'/>Historial de Notas</a>";
                }}));
		
		// render the grid (parameters will be ignored if we have attached to an existing HTML table)
		renderGrid("tablecontent", "testgrid", "tableid");
                //promedio2(editableGrid);
		
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
		displayMessage("Numero de Estudiantes Inscritos " + this.getRowCount()); 
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
function highlightRow(rowId, bgColor, after)
{
	var rowSelector = $("#" + rowId);
	rowSelector.css("background-color", bgColor);
	rowSelector.fadeTo("normal", 0.5, function() { 
		rowSelector.fadeTo("fast", 1, function() { 
			rowSelector.css("background-color", '');
		});
	});
}

function highlight(div_id, style) {
	highlightRow(div_id, style == "error" ? "#e5afaf" : style == "warning" ? "#ffcc00" : "#8dc70a");
}
function updateCellValue(editableGrid, rowIndex, columnIndex, oldValue, newValue, row, onResponse)
{
    if(newValue<=100){
	$.ajax({
		url: '../update.php',
		type: 'POST',
		dataType: "html",
		data: {
			tablename : 'evaluacion',
			id: editableGrid.getRowId(rowIndex), 
			newvalue: editableGrid.getColumnType(columnIndex) == "boolean" ? (newValue ? 1 : 0) : newValue, 
			colname: editableGrid.getColumnName(columnIndex),
			coltype: editableGrid.getColumnType(columnIndex)			
		},
		success: function (response) 
		{ 
			// reset old value if failed then highlight row
			var success = onResponse ? onResponse(response) : (response == "ok" || !isNaN(parseInt(response))); // by default, a sucessfull reponse can be "ok" or a database id 
			if (!success) editableGrid.setValueAt(rowIndex, columnIndex, oldValue);
                        prom2(editableGrid, rowIndex);
		    highlight(row.id, success ? "ok" : "error"); 
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
                }else{
        alert("LA NOTA MAXIMA PERMITIDA ES 100");
    }
   
}
function promedio2(editable){
    est='ABA';
    for(cant=0; cant<editable.getRowCount(); cant++){
        col1=editable.getValueAt(cant, '4');
        col2=editable.getValueAt(cant, '5');
        col3=editable.getValueAt(cant, '6');
        promed=(col1+col2+col3)/3;
        promed=Math.round(promed * 1) / 1;
    if(promed >='51'){
        est='APRO';
    }else{
        est='REPRO';
    }
     editable.setValueAt(cant, '7', promed);
     editable.setValueAt(cant, '8', est);
    }        
}
function prom2(editableG, cant){
    est='ABA';
        col1=editableG.getValueAt(cant, '4');
        col2=editableG.getValueAt(cant, '5');
        col3=editableG.getValueAt(cant, '6');
        promed=(col1+col2+col3)/3;
        promed=Math.round(promed * 1) / 1;
    if(promed >='51'){
        est='APRO';
    }else{
        est='REPRO';
    }
     editableG.setValueAt(cant, '7', promed);
     editableG.setValueAt(cant, '8', est);
}
