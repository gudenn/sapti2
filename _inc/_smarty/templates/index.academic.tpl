{include file="header.tpl"}
{include file="slider.tpl"}
<!-- ####################################################################################################### -->
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="homepage" class="clear">
        <!-- ###### -->
        <div id="left_column">
         
         <h2><a href="{$URL}buscarperfil/buscajax.php">{icono('Search.png','Buscador')} Buscar Proyectos</a></h2>   
         
        </div>
        <!-- ###### -->
        {if isset($sinpermiso)}
        <div id="sinpermisos">
          <h1>No Tiene los permisos suficientes</h1>
          {icono('basicset/warning_48.png','Sin Permisos')}
          No tiene permiso de acceder a ese M&oacute;dulo
        </div>
        <script>
          $( document ).ready(function() {
            $( "#sinpermisos" ).delay( 4000 ).fadeOut( 1000 );
          });
        </script>
        {/if}

          <div id="content"  style="width:685px;min-height: 450px;">
        <h1 class="title">{$description}</h1>
        {include file="menu/central.tpl"}
        <div  style="clear: both;" ></div>
      </div> 

      </div>
    </div>
  </div>
</div>
              
{include file="footer.tpl"}
