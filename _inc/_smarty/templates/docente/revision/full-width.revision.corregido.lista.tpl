{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Lista de Correcciones y Avances</h1>
            <p>
               <label for="nombre de proyecto"><small>NOMBRE DE PROYECTO:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>NOMBRE DE ESTUDIANTE:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span>
            </p>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       	
        </head>
        <div id="wrap">
<table class="tbl_lista">
  <thead>
    <tr>
      <th><a>Id                 </a></th>
      <th><a>Nombre Proyecto    </a></th>
      <th><a>Descripcion        </a></th>
      <th><a>Fecha de Avance    </a></th>
      <th><a>Tipo Avance        </a></th>
      <th><a>Detalle          </a></th>    
    </tr>
  </thead>
  {section name=ic loop=$avances}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$avances[ic]['id']}</td>
      <td>{$avances[ic]['nombrep']}</td>
      <td>{$avance->getResumen($avances[ic]['descripcion'])}</td>
      <td>{$avances[ic]['fecha']}</td>
      <td>{if $avances[ic]['correcionrevision'] > 0}
          {icono('basicset/document_pencil.png','Correccion de Revision')}
          Correccion
          {else}
          {icono('basicset/document.png','Avance de Proyecto')}
          Avance
          {/if}</td>
      <td>
          <a href="avance.detalle.php?docente_id={$objs[ic]['id']}" target="_blank" >{icono('basicset/cabinet.png','Detalle')}Detalle de Correccion</a>
      </td>    
    </tr>
  </tbody>
  {/section}
</table>
        </div>
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}