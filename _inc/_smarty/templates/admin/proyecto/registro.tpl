{include file="admin/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" >
      <h1 class="title"><span class="tipo_mona">FORMULARIO APROBACI&Oacute;N TEMA DE PROYECTO FINAL</span><span class="tipo_moda">FORMULARIO APROBACI&Oacute;N TEMA DE TRABAJO DIRIGIDO</span></h1>
      <div id="respond">
      <form action="" method="post" id="registro" name="registro" >
      <table >
        <tr class="tableholder" >
          <td style="height: 51px;">
            <table style="margin: 0px;">
              <tr>
                <td rowspan="2">
                  Nombre <br>Estudiante:
                </td>
                <td>
                  <input type="text" name="apellido_paterno" value="{$usuario->apellido_paterno}" >
                </td>
                <td>
                  <input type="text" name="apellido_paterno" value="{$usuario->apellido_materno}" >
                </td>
                <td>
                  <input type="text" name="nombre" value="{$usuario->nombre}"  data-validation-engine="validate[required]">
                </td>
                <td>
                  <input type="text" class="numero" name="proyecto_numero_asignado" id="proyecto_numero_asignado" value="{$proyecto->numero_asignado}"  data-validation-engine="validate[required]">
                </td>
              </tr>
              <tr>
                <td>
                  Ap. Paterno:
                </td>
                <td>
                  Ap. Materno:
                </td>
                <td>
                  Nombres:
                </td>
                <td>
                  No. ...
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr class="tableholder" >
          <td  style="height: 33px;">
            <table>
              <tr>
                <td>
                  Tel&eacute;fono:
                </td>
                <td>
                  <input type="text" name="telefono" value="{$usuario->telefono}" >
                </td>
                <td>
                  Email:
                </td>
                <td>
                  <input type="text" name="email" value="{$usuario->email}" >
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr class="tableholder" style="border-bottom: 0px;" >
          <td>
            <table>
              <tr>
                <td  style="height: 29px;">
                  Tutor(es):
                </td>
                <td>
                  <a href="">Asignar o Modificar</a> | <a href="">Actualizar</a>
                </td>
              </tr>
              <!--
              <tr>
                <td  style="height: 29px;">
                  Tribunales:
                </td>
                <td>
                </td>
              </tr>
              -->
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table>
              <tr class="tableholder" >
                <td style="height: 31px;">
                  Carrera:
                </td>
                <td>
                  <select  name="proyecto_carrera_id" id="proyecto_carrera_id"  data-validation-engine="validate[required]" >
                    {html_options values=$carreras_ids selected=$proyecto->carrera_id output=$carreras}
                  </select>
                </td>
                <td>
                  Trabajo&nbsp;Conjunto:
                </td>
                <td>
                  {html_radios name="proyecto_trabajo_conjunto" options=$trabajo_conjunto selected=$trabajo_conjunto_selected separator=""}
                </td>
              </tr>
              <tr class="tableholder" >
                <td style="height: 31px;">
                  Gesti&oacute;n de Aprobaci&oacute;n:
                </td>
                <td>
                  {$semestre->codigo}
                </td>
                <td>
                  Cambio de tema:
                </td>
                <td>
                  {$cambio_tema}
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td style="height: 20px;"><br>
          </td>
        </tr>
        <tr class="tableholder" >
          <td>
            <table>
              <tr>
                <td style="height: 32px;">
                  T&iacute;tulo:
                </td>
                <td>
                  <input type="text" name="proyecto_titulo"  id="proyecto_titulo" value="{$proyecto->nombre}"  data-validation-engine="validate[required]">
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr class="tableholder" >
          <td style="padding-bottom: 10px;">
                  &Aacute;rea(s):
            <table>
              {$i = 0}
              {$j = 0}
              {section name=area start=0 loop=$proyecto->proyecto_area_objs}
                {$i = $smarty.section.area.index + 1}
                {$j = $smarty.section.area.index}
                <tr id="tb_area_{$i}">
                  <td>
                    <input type="hidden" name="area_activa[]" id="activa_area_{$i}" value="1" >
                    <select  name="proyecto_area_id[]" id="proyecto_area_id_{$i}" class="area" correlativo="{$i}" data-validation-engine="validate[required]" >
                      {html_options values=$areas_ids selected='' output=$areas}
                    </select>
                    <span id="actualizando_subareas{$i}" style="display: none">
                      {icono('basicset/loading.gif','Buscando','50px','10px')}
                    </span>
                  </td>
                  <td>
                    Sub-&Aacute;rea:
                  </td>
                  <td>
                    <select  name="proyecto_subarea_id[]" id="proyecto_subarea_id_{$i}" class="subarea" correlativo="{$i}" data-validation-engine="validate[required]" >
                    </select>
                  </td>
                  <td>
                    <a href="#mas"   title="Agregar otra Area" onfocus="addmore(this)" onclick="addmore(this);return false;" xfile="area_{$i+1}" ><img src="{$URL_IMG}activar.png" width="15px" height="15px" alt="Agregar"/></a> 
                    {if ($i>1)}
                    <a href="#mas"   title="Quitar este elemento" onclick="remover(this);return false;" xfile="area_{$i}"  ><img src="{$URL_IMG}delete.png" width="15px" height="15px" alt="Agregar"/></a> 
                    {/if}
                  </td>
                </tr>
              {/section}

              {section name=area start=($i + 1) loop=$TOTALAREAS step=1}
                {$i = $smarty.section.area.index}
                <tr id="tb_area_{$i}"  {if ($i-($j+1)>$baseareas)} style="display:none;"  {/if} >
                  <td>
                    <input type="hidden" name="area_activa[]" id="activa_area_{$i}" value="{if ($i-($j+1)>$baseareas)}0{else}1{/if}" >
                    <select  name="proyecto_area_id[]" id="proyecto_area_id_{$i}" class="area" correlativo="{$i}" data-validation-engine="validate[required]" >
                      {html_options values=$areas_ids selected='' output=$areas}
                    </select>
                    <span id="actualizando_subareas{$i}" style="display: none">
                      {icono('basicset/loading.gif','Buscando','50px','10px')}
                    </span>
                  </td>
                  <td>
                    Sub-&Aacute;rea:
                  </td>
                  <td>
                    <div id="nueva_subarea_{$i}" style="display: none">
                      <input type="text" name="nueva_subarea_nombre[]" id="nueva_subarea_nombrearea_{$i}" value="" >
                      <a href="#mas"   title="Quitar este elemento" onclick="removersubarea(this);return false;" xfile="area_{$i}"  >{icono('basicset/delete_48.png','Quitar','15px')}</a> 
                    </div>
                    <div id="delista_subarea_{$i}">
                      <select  name="proyecto_subarea_id[]" id="proyecto_subarea_id_{$i}" class="subarea" correlativo="{$i}" data-validation-engine="validate[required]" >
                      </select>
                      <a href="#mas"   title="Agregar otra SubArea" onclick="addsubarea(this);return false;" xfile="area_{$i}" >{icono('basicset/agregarboton.png','Agregar','15px')}</a> 
                    </div>
                  </td>
                  <td>
                    <a href="#mas"   title="Agregar otra Area" onfocus="addmore(this,true);" onclick="addmore(this,true);return false;" xfile="area_{$i+1}" >{icono('basicset/plus_48.png','Agregar','15px')}</a> 
                    {if ($i>1)}
                    <a href="#mas"   title="Quitar este elemento" onclick="remover(this,true);return false;" xfile="area_{$i}"  >{icono('basicset/delete_48.png','Quitar','15px')}</a> 
                    {/if}
                  </td>
                </tr>
              {/section}
            </table>
            
          </td>
        </tr>
        <tr class="tableholder" >
          <td>
            <table>
              <tr>
                <td style="height: 35px;">
                  Modalidad:
                </td>
                <td>
                  <select  name="proyecto_modalidad_id" id="proyecto_modalidad_id" data-validation-engine="validate[required]" class="modalidad" >
                    {html_options values=$modalidads_ids selected=$proyecto->modalidad_id output=$modalidads}
                  </select>
                  <span id="actualizando_modalidad" style="display: none">
                    {icono('basicset/loading.gif','Buscando','50px','10px')}
                  </span>
                </td>
                <td style="height: 35px;" class="tipo_moda">
                  Instituci&oacute;n:
                </td>
                <td class="tipo_moda">
                  <span id="instituciones_lista">
                  <select  name="proyecto_institucion_id" id="proyecto_institucion_id" data-validation-engine="validate[required]" >
                    {html_options values=$instituciones_ids selected=$proyecto->institucion_id output=$instituciones}
                  </select>
                    <a href="#mas"   title="Actualizar Instituciones" onclick="agregarinstitucion();return false;"  >
                     {icono('basicset/agregarboton.png','Actualizar','15px')} Nueva
                    </a> 
                  </span>
                  <span id="instituciones_nueva" style="display: none">
                    <input type="text" name="proyecto_institucion_nueva" id="proyecto_institucion_nueva" value="" >
                    <a href="#mas"   title="Quitar este elemento" onclick="removerinstitucion();return false;" >{icono('basicset/delete_48.png','Quitar','15px')} Quitar</a> 
                  </span>
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr class="tableholder" >
          <td>
            <table>
              <tr>
                <td style="height: 61px;vertical-align: top; ">
                  Objetivo General:
                </td>
                <td>
                  <textarea  name="proyecto_objetivo_general"   id="proyecto_objetivo_general"  >{$proyecto->objetivo_general}</textarea>
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr class="tableholder" >
          <td>
            <table>
              <tr>
                <td style="height: 87px;vertical-align: top; ">
                  Objetivos Espec&iacute;ficos:
                </td>
                <td>
                  <table id="ojbs_es">
                  {$i = 0}
                  {section name=foo start=0 loop=$proyecto->objetivo_especifico_objs}
                    {$i = $smarty.section.foo.index + 1}
                    {$j = $smarty.section.foo.index}
                    <tr id="tb_{$i}">
                      <td>
                        <input type="text" name="objetivo_especifico[]" id="objetivo_especifico_{$i}" value=""  data-validation-engine="validate[required]">
                      </td>
                      <td>
                        <a href="#mas"   title="Agregar otra caja" onfocus="addmore(this,false);" onclick="addmore(this,false);return false;" xfile="{$i+1}" ><img src="{$URL_IMG}activar.png" width="15px" height="15px" alt="Agregar"/></a> 
                        {if ($i>1)}
                        <a href="#mas"   title="Quitar este elemento" onclick="remover(this,false);return false;" xfile="{$i}"  ><img src="{$URL_IMG}delete.png" width="15px" height="15px" alt="Agregar"/></a> 
                        {/if}
                      </td>
                    </tr>
                  {/section}

                  {section name=foo start=($i + 1) loop=$TOTAL step=1}
                    {$i = $smarty.section.foo.index}
                    <tr id="tb_{$i}"  {if ($i-($j+1)>$base)} style="display:none;"  {/if} >
                      <td>
                        <input type="text" name="objetivo_especifico[]" id="objetivo_especifico_{$i}" value=""  data-validation-engine="validate[required]">
                      </td>
                      <td>
                        <a href="#mas"   title="Agregar otra caja" onfocus="addmore(this,false)" onclick="addmore(this,false);return false;" xfile="{$i+1}" >{icono('basicset/plus_48.png','Agregar','15px')}</a> 
                        {if ($i>1)}
                        <a href="#mas"   title="Quitar este elemento" onclick="remover(this,false);return false;" xfile="{$i}"  >{icono('basicset/delete_48.png','Quitar','15px')}</a> 
                        {/if}
                      </td>
                    </tr>
                  {/section}
                  </table>
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr class="tableholder" style="border-bottom: 0px;" >
          <td style="height: 116px;">
            <table>
              <tr>
                <td>
                  Descripci&oacute;n:
                </td>
              </tr>
              <tr>
                <td>
                  <textarea name="proyecto_descripcion"  id="proyecto_descripcion"  data-validation-engine="validate[required]" >{$proyecto->descripcion}</textarea>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table id="firmmas">
              <tr>
                <td style="height: 32px;">
                  <input type="text" name="proyecto_director_carrera" value="{$director_carrera}"  data-validation-engine="validate[required]">
                </td>
                <td>
                  <select  name="proyecto_docente_materia" id="proyecto_docente_materia" data-validation-engine="validate[required]" >
                    {html_options values=$docentes_materia selected=$docente_seleccionado output=$docentes_materia}
                  </select>
                </td>
                <td>
                  Tutor
                </td>
                <td class="tipo_moda">
                  <select  name="proyecto_responsable" id="proyecto_responsable" data-validation-engine="validate[required]" >
                    {html_options values=$docresp selected=$docresp_sel output=$docresp}
                  </select>
                </td>
                <td>
                  {$estudiante->getNombreCompleto()}
                </td>
              </tr>
              <tr>
                <td style="height: 64px;">
                  Director de Carrera:
                </td>
                <td>
                  Docente Materia:
                </td>
                <td>
                  Tutor:
                </td>
                <td class="tipo_moda">
                  Responsable:
                </td>
                <td>
                  Estudiante:
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;
          </td>
        </tr>
        <tr class="tableholder" >
          <td>
            <table>
              <tr>
                <td style="height: 33px;">
                  Registrado por:
                </td>
                <td>
                  <input type="text" name="proyecto_registrado_por" value="{$registrado_por}"  data-validation-engine="validate[required]">
                </td>
                <td>
                  Fecha:
                </td>
                <td>
                  {$fecha}
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr>
          <td>&nbsp;
          </td>
        </tr>
        <tr class="tableholder" >
          <td style="text-align: center;">
            <p>
              <input type="hidden" name="id"    value="{$area->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Cancelar">
            </p>
          </td>
        </tr>
      </table>

    </form>
    </div>
  </div>
  <p>{$ERROR}</p>
  <p>Todos los campos con (*) son obligatorios.</p>
  <script type="text/javascript">
  {literal} 
    function addmore(test,tipoarea)
    {
      jQuery("#tb_"+$(test).attr("xfile")).fadeIn('slow');
      if (!tipoarea)
      jQuery("#objetivo_especifico_"+$(test).attr("xfile")).focus();
      else
      jQuery("#activa_"+$(test).attr("xfile")).val('1');
    }
    function remover(test,tipoarea)
    {
      jQuery("#tb_"+$(test).attr("xfile")).fadeOut('slow');
      if (!tipoarea)
      jQuery("#objetivo_especifico_"+$(test).attr("xfile")).val('');
      else
      jQuery("#activa_"+$(test).attr("xfile")).val('0');
    }
    function agregarinstitucion()
    {
      //nueva_subarea_ delista_subarea_
      jQuery("#instituciones_nueva").show();
      jQuery("#instituciones_lista").hide();
    }
    function removerinstitucion()
    {
      //nueva_subarea_ delista_subarea_
      jQuery("#instituciones_nueva").hide();
      jQuery("#instituciones_lista").show();
      jQuery("#proyecto_institucion_nueva").val('');
      
    }
    function addsubarea(test)
    {
      //nueva_subarea_ delista_subarea_
      jQuery("#nueva_sub"+$(test).attr("xfile")).show();
      jQuery("#delista_sub"+$(test).attr("xfile")).hide();
    }
    function removersubarea(test)
    {
      //nueva_subarea_ delista_subarea_
      jQuery("#nueva_sub"+$(test).attr("xfile")).hide();
      jQuery("#delista_sub"+$(test).attr("xfile")).show();
      jQuery("#nueva_subarea_nombre"+$(test).attr("xfile")).val('');
      
    }
    
    jQuery(function(){
      jQuery("select.modalidad").change(function(){
        jQuery("#actualizando_modalidad").show();
        jQuery.getJSON("proyecto.ajax.php",{modalidad_id: jQuery(this).val(), ajax: 'true'}, function(j){
          //console.log(j[0].datos);
          {/literal}
          if (j.length && j[0].datos === '{$adicionales_SI}' )
          {
          {literal}
            //console.log(j[0].datos);
            jQuery(".tipo_mona").hide();
            jQuery(".tipo_moda").fadeIn('slow');
          }
          else
          {
            jQuery(".tipo_moda").hide();
            jQuery(".tipo_mona").fadeIn('slow');
          }
          jQuery("#actualizando_modalidad").fadeOut('slow');
        });
      });
      jQuery("select.area").change(function(){
        var correlavivo = jQuery(this).attr('correlativo');
        jQuery("#actualizando_subareas"+correlavivo).show();
        jQuery.getJSON("proyecto.ajax.php",{area_id: jQuery(this).val(), ajax: 'true'}, function(j){
          var options = '';
          for (var i = 0; i < j.length; i++) {
            options += '<option value="' + j[i].optionValue + '">' + j[i].optionDisplay + '</option>';
          }
          //console.log("select#proyecto_subarea_id_"+correlavivo);
          jQuery("select#proyecto_subarea_id_"+correlavivo).html(options);
          jQuery("#actualizando_subareas"+correlavivo).fadeOut('slow');
        });
      });
    });
    jQuery(document).ready(function(){
      jQuery("#registro").validationEngine();
      var wo = 'bottomRight';
      jQuery('input').attr('data-prompt-position',wo);
      jQuery('input').data('promptPosition',wo);
      jQuery('textarea').attr('data-prompt-position',wo);
      jQuery('textarea').data('promptPosition',wo);
      jQuery('select').attr('data-prompt-position',wo);
      jQuery('select').data('promptPosition',wo);
    });
  {/literal} 
  </script>
  </div>
  {$ERROR}
</div>

{include file="footer.tpl"}