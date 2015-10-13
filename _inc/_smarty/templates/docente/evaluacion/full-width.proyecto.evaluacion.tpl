{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Registro de Evaluaciones</h1>
            <p>
               <b>Proyecto:</b> {$proyecto->nombre}<br/>
               <b>Estudiante:</b> {$usuario->getNombreCompleto()|upper}
            </p>
        <div id="wrap">
        <div style="height: 250px; width: 920px; font-size: 12px; overflow: auto; border-width: 4px; border-style: solid">
<table class="tbl_lista">
  <thead>
    <tr>
      <th>Id           </th>
      <th>Estado       </th>
      <th>Fecha        </th>
      <th>Descripci&oacute;n  </th>
      <th>Revisor      </th>
      <th>Detalle      </th>
      <th>Opciones     </th>

    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}" >
      <td>{$objs[ic][0]}</td>
      <td>{$avance->getEstadoAvance($objs[ic][1])}</td>
      <td>{$objs[ic][2]}</td>
      <td>{$avance->getResumen($objs[ic][3])}</td>
      <td>Avance</td>
      <td>
          <a href='#' class='avancedetalle' id="{$objs[ic][0]}" style=\"cursor:pointer\">Ver {icono('basicset/search_48.png','Detalle')}</a>
        <br><a href="../revision/avance.detalle.php?iddicta={$iddicta}&avance_id={$objs[ic][0]}&estudiente_id={$estudiante->id}" target="_blank" >Revisar {icono('basicset/document_pencil.png','Detalle')}</a>
      </td>
      {if $objs[ic][4]=='NO'}
          <td> <div align="center" style="font-weight:bold;" >Sin Revisiones</div></td>
          {else}
          <td> <div align="center" id="best{$objs[ic][0]}" onClick="desplegar('tdesp{$objs[ic][0]}','best{$objs[ic][0]}')" style="cursor: pointer;" class="sendme">Revisiones</div></td>
              {/if}
    </tr>
    <tr style="border:thick solid #969595">
        <td colspan="2"></td>
        <td colspan="5"> 
    <table id="tdesp{$objs[ic][0]}" style="display:none;">
          <thead>
    <tr>
      <th class="dentro">Id                         </th>
      <th class="dentro">Estado                     </th>
      <th class="dentro">Fecha Revisi&oacuten       </th>
      <th class="dentro">Tipo Revisor              </th>
      <th class="dentro">Nombre Revisor            </th>
      <th class="dentro">Fecha Correcci&oacuten    </th>
      <th class="dentro">Opciones                  </th>                  </th>

    </tr>
           </thead>
        <tbody>
        {section name=ic1 loop=$objs[ic][4]}
     <tr class="{cycle values="light,dark"}">
    <td>{$objs[ic][4][ic1]['id']}</td> 
    <td>{$revision->getEstadoRevision($objs[ic][4][ic1]['estado'])}</td> 
    <td>{$objs[ic][4][ic1]['fecha_re']}</td>
    <td>{icono($objs[ic][4][ic1]['revisor']|cat:'_48.png','Revisor')}{$revision->getRevisorTipoNom($objs[ic][4][ic1]['revisor'])}</td>
    <td>{$revision->getRevisor($objs[ic][4][ic1]['idrev'],$objs[ic][4][ic1]['revisor'])}</td>
    <td>{$objs[ic][4][ic1]['fecha_co']}</td>
    <td><a href='#' class='observaciondetalle' id="{$objs[ic][4][ic1]['id']}" style="cursor:pointer">Ver {icono('basicset/search_48.png','Detalle')}</a></td>
     </tr>
        {/section}
        </tbody>
    </table>
        </td>
    </tr>

  </tbody>
  {/section}
</table>

</div>
        <h1 class="title">Evaluaciones</h1>
        <form action="#" method="post" id="registro" name="registro" onSubmit="return acti();">
        <table class="tbl_lista">
              <thead>
                <tr>
                  <th>Evaluaci&oacute;n 1    </th>
                  <th>Evaluaci&oacute;n 2    </th>
                  <th>Evaluaci&oacute;n 3    </th>
                  <th>Promedio       </th>
                  <th>Editar         </th>
                  <th>Registrar      </th>
                  <th>Historial      </th>
                </tr>
              </thead>
            <tr class="dark">
               <th>
                   <input type="number" name="evaluacion_1" id="evaluacion_1" value="{$evaluacion->evaluacion_1}" disabled="disabled" onkeyup="promedio.value = Math.round(((parseInt(evaluacion_1.value) + parseInt(evaluacion_2.value) + parseInt(evaluacion_3.value))/3)* 1) / 1" onkeypress="return validarNro(event)" min=0 max=100>
               </th>
               <th>
                   <input type="number" name="evaluacion_2" id="evaluacion_2" value="{$evaluacion->evaluacion_2}" disabled="disabled" onkeyup="promedio.value = Math.round(((parseInt(evaluacion_1.value) + parseInt(evaluacion_2.value) + parseInt(evaluacion_3.value))/3)* 1) / 1" onkeypress="return validarNro(event)" min=0 max=100>
               </th>
               <th>
                   <input type="number" name="evaluacion_3" id="evaluacion_3" value="{$evaluacion->evaluacion_3}" disabled="disabled" onkeyup="promedio.value = Math.round(((parseInt(evaluacion_1.value) + parseInt(evaluacion_2.value) + parseInt(evaluacion_3.value))/3)* 1) / 1" onkeypress="return validarNro(event)" min=0 max=100>
               </th>
               <th>
                   <input type="text" name="promedio" id="promedio" value="{$evaluacion->promedio}" readonly>
               </th>
               <th>
                   <input type="button" onClick="activar(this)" value="Editar">
               </th>
               <th>
                   <input type="hidden" name="tarea" value="registrar">
                   <input type="hidden" name="token" value="{$token}">
                   <input name="submit" type="submit" id="submit" value="Grabar">
               </th>
               <th>
                   <a href='#' class='historial' id={$evaluacion->id} >{icono('basicset/graph.png','Historial de Notas')}Historial</a>
               </th>
            </tr>
        </table>
        </form>       
        </div>
        <p>{$ERROR}</p>
     </div>
    {$ERROR}
    </div>
</div>
{include file="footer.tpl"}
        <script type="text/javascript">
                editableGrid.onloadXML("../revision/loaddata.revision.lista.php?doc={$estudiante->id}");
        </script>
        <script type="text/javascript">
            function activar(bott){
            if(bott.value == 'Editar'){
            bott.value = 'No Editar';
            document.getElementById('evaluacion_1').disabled = false;
            document.getElementById('evaluacion_2').disabled = false;
            document.getElementById('evaluacion_3').disabled = false;
            }else{
            bott.value = 'Editar';
            document.getElementById('evaluacion_1').disabled = 'disabled';
            document.getElementById('evaluacion_2').disabled = 'disabled';
            document.getElementById('evaluacion_3').disabled = 'disabled';
            }
            }
            function acti(){
            document.getElementById('evaluacion_1').disabled = false;
            document.getElementById('evaluacion_2').disabled = false;
            document.getElementById('evaluacion_3').disabled = false;
            }
            function validarNro(e) {
            var key;
            if(window.event) // IE
                    {
                    key = e.keyCode;
                    }
            else if(e.which) // Netscape/Firefox/Opera
                    {
                    key = e.which;
                    }

            if (key < 48 || key > 57)
                {
                if(key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
                    { return true; }
                else 
                    { return false; }
                }
            return true;
            }
        </script>
<script type="text/javascript"> 
    var visto = null;
function desplegar(tabla_a_desplegar,estadoT) { 
var tablA = document.getElementById(tabla_a_desplegar); 
var estadOt = document.getElementById(estadoT);  

switch(tablA.style.display) { 
case "none": 
tablA.style.display = "block"; 
estadOt.innerHTML = "Revisiones"; 
break; 
default: 
tablA.style.display = "none"; 
estadOt.innerHTML = "Revisiones" 
break; 
}
if (visto != null)
visto.style.display = 'none';
visto = (tablA==visto) ? null : tablA;
} 
</script>