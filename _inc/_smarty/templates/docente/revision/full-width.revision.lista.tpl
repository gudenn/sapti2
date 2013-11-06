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
            <table class="tbl_lista">
  <thead>
    <tr>
      <th>Id           </th>
      <th>Estado       </th>
      <th>Fecha        </th>
      <th>Descripcion  </th>
      <th>Revisor      </th>
      <th>Detalle      </th>

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
 
    </tr>
    {section name=ic1 loop=$objs[ic][4]}
     <tr>
    <td>{$objs[ic][4][ic1]['id']}</td> 
    <td>{$revision->getEstadoRevision($objs[ic][4][ic1]['estado'])}</td> 
    <td>{$objs[ic][4][ic1]['fecha_re']}</td>
        <td></td>
    <td>{$revision->getRevisor(4,$objs[ic][4][ic1]['revisor'])}</td>
    <td><a href='#' class='observaciondetalle' id="{$objs[ic][4][ic1]['id']}" style="cursor:pointer">Ver {icono('basicset/search_48.png','Detalle')}</a></td>
    </tr>
        {/section}

  </tbody>
  {/section}
</table>

        </div>
        <p>{$ERROR}</p>
     </div>
    {$ERROR}
    </div>
</div>
{include file="footer.tpl"}
