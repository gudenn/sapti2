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

        

      </div>
    </div>
  </div>
</div>
              
{include file="footer.tpl"}
