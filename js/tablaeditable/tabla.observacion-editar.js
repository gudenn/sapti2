/**
 *  highlightRow and highlight are used to show a visual feedback. If the row has been successfully modified, it will be highlighted in green. Otherwise, in red
 */
var tab='';
var rev='';
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
        
/**
   updateCellValue calls the PHP script that will update the database. 
 */
function updateCellValue(editableGrid, rowIndex, columnIndex, oldValue, newValue, row, onResponse)
{
	$.ajax({
		url: '../update.php',
		type: 'POST',
		dataType: "html",
		data: {
			tablename : editableGrid.name,
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
		    highlight(row.id, success ? "ok" : "error"); 
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}

function DatabaseGrid(revid) 
{ 
        this.editableGrid = new EditableGrid("observacion", {
		enableSort: true,
   	    tableLoaded: function() { datagrid.initializeGrid(tab=this); },
		modelChanged: function(rowIndex, columnIndex, oldValue, newValue, row) {
   	    	updateCellValue(this, rowIndex, columnIndex, oldValue, newValue, row);
       	}
 	});
        
        rev=revid;
	this.fetchGrid(revid); 
	
}
DatabaseGrid.prototype.fetchGrid = function(revid)  {
	// call a PHP script to get the data
           this.editableGrid.loadXML("loaddata.observacion.editar.php?revid="+revid);

};

DatabaseGrid.prototype.initializeGrid = function(grid) {
             grid.setCellRenderer("action", new CellRenderer({render: function(cell, value) {
		cell.innerHTML = "<a onclick=\"if (confirm('Esta seguro de eliminar esta Observacion ? ')) {deletete(" + grid.getRowId(cell.rowIndex) + "); updatetable("+cell.rowIndex+");} \" style=\"cursor:pointer\">" +
						 "<img src=\"" + image("borrar.png") + "\" border=\"0\" alt=\"delete\" title=\"Delete row\"/></a>";
		}}));
             grid.renderGrid("tablecontent", "testgrid");
};

function image(relativePath) {
	return "../../images/icons/" + relativePath;
}
function deletete(obser){
   ajax=objetoAjax();
   ajax.open("POST", "edicion.observacion.php?observacioneliminar="+obser);
   ajax.send(null);
};
function updatetable(rowIndex)
{
    tab.remove(rowIndex);
};
function enviarDatosObservacion(){
  //recogemos los valores de los inputs
  observacion=document.nueva_observacion.observacion.value;
  if(observacion!=''){
        //instanciamos el objetoAjax
  ajax=objetoAjax();
  //uso del medotod POST
  //archivo que realizará la operacion
  ajax.open("POST", "edicion.observacion.php?observacionregistro="+observacion+"&revid="+rev,true);
    //cuando el objeto XMLHttpRequest cambia de estado, la función se inicia
  ajax.onreadystatechange=function() {
	  //la función responseText tiene todos los datos pedidos al servidor
  	if (ajax.readyState==4) {
  		//mostrar resultados en esta capa
                datagrid = new DatabaseGrid(rev);
		//llamar a funcion para limpiar los inputs
		LimpiarCampos();
	}
 }
	ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//enviando los valores a registro.php para que inserte los datos
	ajax.send(null);
  }else{
      alert("INTRODUSCA NUEVA OBSERVACION");
  };

};
 
//función para limpiar los campos
function LimpiarCampos(){
  document.nueva_observacion.observacion.value="";
  document.nueva_observacion.observacion.focus();
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
