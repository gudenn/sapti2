{include file="admin/header-sjq.tpl"}

<div class="wrapper row3">
  <div class="rnd">
    <div id="container" >
      <h1 class="title"><span class="tipo_mona">FORMULARIO APROBACI&Oacute;N TEMA DE PROYECTO FINAL</span><span class="{$tipo_moda}">FORMULARIO APROBACI&Oacute;N TEMA DE TRABAJO DIRIGIDO</span></h1>
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
                  
                  <span>{$usuario->apellido_paterno}</span>
                </td>
                <td>
                    <span>{$usuario->apellido_materno}</span>
                </td>
                <td>
                    <span>{$usuario->nombre}</span>
                </td>
                <td>
                    <span>{$proyecto->numero_asignado}</span>
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
                    <span>{$usuario->telefono}</span>
                </td>
                <td>
                  Email:
                </td>
                <td>
                    <span>{$usuario->email}</span>
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
              </tr>
              <tr>
                <td id="lista_tutores" style="height: 29px;padding-left: 40px">
                {section name=tutor start=0 loop=$tutores}
                   {$tutores[tutor]->getNombreCompleto()}<br>
                {/section}
                </td>
              </tr>
              <tr>
                <td>
                
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
                     <span>{$carr}</span>
                
                </td>
                <td>
              
                </td>
                <td>
                 
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
                </td>
                <td>
               
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
                    <span>{$proyecto->nombre}</span>
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr class="tableholder" >
          <td style="padding-bottom: 10px;">
                  &Aacute;rea(s):
  <table class="tbl_lista" id="areasp"  mane="areasp">
     <tbody>                  
            {section name=ic loop=$areasp}
            <tr  class="selectable">
            <tr  class="{cycle values="light,dark"}">
            <td>{$areasp[ic]['nombre']}</td>
            </tr>
    
    
            {/section}
              </tbody> 
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
                    <span>{$m}</span>
                </td>
                <td style="height: 35px;" class="{$tipo_moda}">
                  Instituci&oacute;n:
                </td>
                <td class="{$tipo_moda}">
                  <span id="instituciones_lista">
                  <select  name="proyecto_institucion_id" id="proyecto_institucion_id" data-validation-engine="validate[required]" >
                    {html_options values=$instituciones_ids selected=$proyecto->institucion_id output=$instituciones}
                  </select>
                    <a href="#mas"   title="Actualizar Instituciones" onclick="agregarinstitucion();return false;"  >
                     {icono('basicset/agregarboton.png','Actualizar','15px')} Nueva {getHelpTip('nuevainstitucion')}
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
                    <span>{$proyecto->objetivo_general}</span>
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
              
                <table class="tbl_lista" id="obp"  mane="obp">
                  <tbody>                  
                       {section name=ic loop=$obp}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
        <td>{$obp[ic]['descripcion']}</td>
     </tr>
    
    
                              {/section}
              </tbody> 
              </table>
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
                    <span>{$proyecto->descripcion}</span>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table id="firmmas">
            
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
             
            </p>
          </td>
        </tr>
      </table>

    </form>
    </div>
  <p>{$ERROR}</p>
 
  </div>
  <div class="clear"></div>
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
    /*
    jQuery(document).ready(function(){
      jQuery("#registro").validationEngine();
      var wo = 'bottomRight';
      jQuery('input').attr('data-prompt-position',wo);
      jQuery('input').data('promptPosition',wo);
      jQuery('textarea').attr('data-prompt-position',wo);
      jQuery('textarea').data('promptPosition',wo);
      jQuery('select').attr('data-prompt-position',wo);
      jQuery('select').data('promptPosition',wo);
    });*/
  {/literal} 
  </script>
  </div>
  {$ERROR}
</div>

{include file="footer.tpl"}