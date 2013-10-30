{if (isset($menuizquierda))}
<div id="column">
  <div class="subnav">
    <h2>Menu Consejo</h2>
    <ul id="menuizq">
    {section name=ic loop=$menuizquierda}
      {assign var="menu" value=$menuizquierda[ic]}
    
    
      <li><a href="#" onclick="return false;">{$menu->nombre_menu}</a>
        <ul class="subMenu">
        {section name=id loop=$menu->menu_items}
          {assign var="menu_item" value=$menu->menu_items[id]}
          <li><a href="{$URL}{$menu_item->link}" target="{$menu_item->target}" title="{$menu_item->descripcion}" >{$menu_item->titulo}</a>
          </li>
        {/section}
        </ul>
      </li>
    {/section}
    </ul>
  </div>
</div>
{else}
  <div id="column">
  <div class="subnav">
    <h2>Menu SAPTI</h2>
    <ul id="menuizq">
      <li><a href="#">Free Website Templates</a></li>
      <li><a href="#">Free CSS Templates</a>
        <ul class="subMenu">
          <li><a href="#">Free XHTML Templates</a></li>
          <li><a href="#">Free Web Templates</a></li>
        </ul>
      </li>
      <li><a href="#">Free Website Layouts</a>
        <ul class="subMenu">
          <li><a href="#">Free Website Software</a></li>
          <li><a href="#">Free Webdesign Templates</a>
            <ul>

              <li><a href="{$URL}estudiante/">Inicio</a></li>
              {if ($proyecto)}
              <li><a href="{$URL}estudiante/">Proyecto Final</a>
                <ul>
                  <li><a href="{$URL}estudiante/proyecto-final/correcion.gestion.php">Registro Correci&oacute;n</a></li>
                  <li><a href="{$URL}estudiante/proyecto-final/archivo.gestion.php">Archivo</a></li>
                  <li><a href="{$URL}estudiante/proyecto-final/notificacion.gestion.php">Notificaciones</a></li>
                </ul>
              </li>
              {/if}
              {if (  $proyecto->estado_proyecto==$vb )}
              <li><a href="{$URL}estudiante/proyecto/proyecto.registro.php">Registro Formulario</a></li>
              {/if}
              <li><a href="editar.cuenta.php">Modificar Cuenta</a></li>
              <li><a href="editar.cuenta.php">Preferencias</a></li>
              <li><a href="{$URL}?salirestudiante=1">Salir</a></li>

              <li><a href="#">Free FireWorks Templates</a></li>
              <li><a href="#">Free PNG Templates</a></li>
            </ul>
          </li>
        </ul>
      </li>
      <li><a href="#">Free Website Themes</a></li>
    </ul>
  </div>
  <div class="holder"></div>
  <div class="subnav">
    <h2>Cronograma de eventos</h2>

    {include file="cronograma/cronograma.tpl"}
  </div>
</div>

{/if}
{literal}
   <script type="text/javascript">
    $(function(){
      $("#menuizq>li ul").hide();
      $('ul#menuizq>li').click(function() {$(this).children('ul').fadeIn(200);}); //Hand!
    });
   </script>
{/literal}
