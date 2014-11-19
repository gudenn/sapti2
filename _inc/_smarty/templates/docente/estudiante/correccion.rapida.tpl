{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <div id="wrap">
            <h1 class="title">Nuevos Avances</h1>
<table class="tbl_lista">
  <thead>
    <tr>
      <th>C&oacute;digo SIS   </th>
      <th>Estudiante   </th>
      <th>Proyecto     </th>

    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}" >
      <td>{$objs[ic][1]}</td>
      <td>{$objs[ic][2]}</td>
      <td>{$objs[ic][3]}</td>
    </tr>
    <tr>
        <td colspan="3"> 
    <table>
          <thead>
    <tr>
      <th>Id                         </th>
      <th>Fecha Avance            </th>
      <th>Descripci&oacute;n             </th>
      <th>Opciones                  </th>

    </tr>
           </thead>
        <tbody>
        {section name=ic1 loop=$objs[ic][4]}
     <tr class="{cycle values="light,dark"}">
    <td>{$objs[ic][4][ic1]['id']}</td> 
    <td>{$objs[ic][4][ic1]['fecha_avance']}</td>
    <td>{$objs[ic][4][ic1]['descripcion']}</td>
    <td><textarea name="correcc{$objs[ic][4][ic1]['id']}" id="correcc{$objs[ic][4][ic1]['id']}" rows="4" cols="30"></textarea>
        <a id="{$objs[ic][4][ic1]['id']}" style="cursor:pointer" onclick="registroRevicion(correcc{$objs[ic][4][ic1]['id']}.value,{$objs[ic][4][ic1]['id']},{$objs[ic][0]});">Grabar</a></td>
     </tr>
        {/section}
        </tbody>
    </table>
        </td>
    </tr>

  </tbody>
  {/section}
</table>
            <h1 class="title">Nuevas Correcciones</h1>
<table class="tbl_lista">
  <thead>
    <tr>
      <th>C&oacute;digo SIS   </th>
      <th>Estudiante   </th>
      <th>Proyecto     </th>

    </tr>
  </thead>
  {section name=ic loop=$objs1}
  <tbody>
    <tr  class="{cycle values="light,dark"}" >
      <td>{$objs1[ic][1]}</td>
      <td>{$objs1[ic][2]}</td>
      <td>{$objs1[ic][3]}</td>
    </tr>
    <tr>
        <td colspan="4"> 
    <table>
          <thead>
    <tr>
      <th>Id                      </th>
      <th>Fecha Avance            </th>
      <th>Avance                  </th>
      <th>Observaci&oacute;n y Respuesta </th>
      <th>Opciones                </th>

    </tr>
           </thead>
        <tbody>
        {section name=ic1 loop=$objs1[ic][4]}
     <tr class="{cycle values="light,dark"}">
    <td>{$objs1[ic][4][ic1]['id']}</td> 
    <td>{$objs1[ic][4][ic1]['fecha']}</td>
    <td>{$objs1[ic][4][ic1]['descripcion']}</td>
    <td>{$objs1[ic][4][ic1]['obser']}</td>
    <td>Aprobar:<input type="checkbox" name='apro' value={$objs1[ic][4][ic1]['id']} class="checkbox" onclick="aprobacionCorreccion({$objs1[ic][4][ic1]['id']},{$objs1[ic][0]});">
        No Aprobar:<input type="checkbox" name='desapro' value={$objs1[ic][4][ic1]['id']} class="checkbox" onclick="noaprobacionCorreccion({$objs1[ic][4][ic1]['id']},{$objs1[ic][0]});">
    </td>
     </tr>
        {/section}
        </tbody>
    </table>
        </td>
    </tr>

  </tbody>
  {/section}
</table>
<input type="text" id="iddicta" name="iddicta" value="{$iddicta}" style="display: none"/>
<input type="text" id="iddoc" name="iddoc" value="{$iddoc}" style="display: none"/>
        </div>
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}
<script type="text/javascript"> 
var iddicta=eval($("#iddicta").val());
var iddoc=eval($("#iddoc").val());
function registroRevicion(obser,idava,idest){
	$.ajax({
		url: 'correccion.rapida.registro.php',
		type: 'POST',
		dataType: "html",
		data: {
			iddicta :  iddicta,
                        iddoc :  iddoc,
                        idava :  idava,
                        idest :  idest,
                        obser :  obser,
			registro:   'registro'
		},
		success: function (response) 
		{
                    if(response=='ok'){
                        document.location.href = document.location.href;
                    }else{
                        alert('Error No se Grabo la Revision.')
                    }
		},
		error: function() { alert("Ajax failure\n" + errortext); },
		async: true
	}); 
};
function aprobacionCorreccion(idrev,idest){    
	$.ajax({
		url: 'correccion.rapida.registro.php',
		type: 'POST',
		dataType: "html",
		data: {
			iddicta :  iddicta,
                        idrev :  idrev,
                        idest :  idest,
			registro:   'aprobar'
		},
		success: function (response) 
		{
                    if(response=='ok'){
                        document.location.href = document.location.href;
                    }else{
                        alert('Error No se Aprobo la Correccion.')
                    }
		},
		error: function() { alert("Ajax failure\n" + errortext); },
		async: true
	}); 
};
function noaprobacionCorreccion(idrev,idest){    
	$.ajax({
		url: 'correccion.rapida.registro.php',
		type: 'POST',
		dataType: "html",
		data: {
			iddicta :  iddicta,
                        iddoc :  iddoc,
                        idrev :  idrev,
                        idest :  idest,
			registro:   'noaprobar'
		},
		success: function (response) 
		{
                    if(response=='ok'){
                        document.location.href = document.location.href;
                    }else{
                        alert('Error No se Grabo.')
                    }
		},
		error: function() { alert("Ajax failure\n" + errortext); },
		async: true
	}); 
};
</script> 