{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Seguimiento de Proyecto</h1>
            <p>
               <b>Proyecto:</b> {$proyecto->nombre}<br/>
               <b>Estudiante:</b> {$usuario->getNombreCompleto()|upper}
            </p>
        <div id="wrap">
        <div style="height: auto; width: 920px; font-size: 12px; overflow: auto; border-width: 4px; border-style: solid">
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
        <br><a href="../tutor/avance.detalle.php?avance_id={$objs[ic][0]}&estudiente_id={$estudiante->id}" target="_self" >Revisar {icono('basicset/document_pencil.png','Detalle')}</a>
      </td>
      {if $objs[ic][4]=='NO'}
          <td> <div align="center" style="font-weight:bold;" >Sin Revisiones</div></td>
          {else}
          <td> <div align="center" id="best{$objs[ic][0]}" onClick="desplegar('tdesp{$objs[ic][0]}','best{$objs[ic][0]}')" style="cursor: pointer;" class="sendme">Revisiones</div></td>
              {/if}
 
    </tr>
    <tr style="border: 2px dotted;">
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
      <th class="dentro">Opciones                  </th>

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
        </div>
        <p>{$ERROR}</p>
     </div>
    {$ERROR}
    </div>
</div>
{include file="footer.tpl"}
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

