 <div id="content">
     <form action="" method="post">
      <h1> Detalle del Proyecto </h1>
       <label for="nombre">Estudiante:  {$usuariobuscado->getNombreCompleto()}</label><br />
           <label for="nombre">C&oacute;digo sis:   {$estudiantebuscado->codigo_sis}</label><br />
         <label for="nombre">Proyecto:   {$proyectobuscado->nombre}</label><br />
 
         <label for="nombre">Area:   {foreach from=$proyectoarea item=curr_id}
                                    {$curr_id->nombre}<br />
                                   {/foreach}</label><br />
       <p>
         
              <Hi> Tribunales</Hi>
<table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
    <tr>
    <th><a >ID          </a></th>
    <th><a >NOMBRE      </a></th>
    <th><a  >APELLIDOS     </a></th>
    <th><a  >TIEMPO  </a></th>
     </tr>
  </thead>
  <tbody>
  
    
  {section name=ic loop=$listadocentes}
    
    <tr  class="selectable">
   
      <td>{$listadocentes[ic][0]}
        <input type="hidden" name="ids[]" value="{$listadocentes[ic][0]}">
      </td>
      <td>
        {$listadocentes[ic][1]}
      </td>
      <td>{$listadocentes[ic][2]}</td>

<td>     <a  class="tooltip"> Dis
  <span>
 <div id="content"  style="width:685px;min-height: 300px;">
    <div id="verhorario">
    {$diass->llemartabla($listadocentes[ic][0])}
    </div>
</div>
 </span> 
    </a>
</td>
     
    </tr>
    
  {/section}
    </tbody> 
</table>
         
         
              <select name=lugar_id required="">
         {html_options values=$lugar_id output=$lugar_nombre}
         </select>
         <label for="lugar"><small>Lugar</small></label>
         </p>
         
           <p>
               <select name=accion required="">
   {html_options options=$accion}
  </select>
  
         <label for="lugar"><small>Tipo Defensa</small></label>
         </p>
       

             <p>
               <input type="text" name="fecha_defensa" id="fecha_defensa" value="{$defensa->fecha_defensa}" size="22" required>
              <label for="fecha_cumple"><small>Fecha Defensa</small></label>
            </p>
            
            <p>
<select  id="hora_ini" name="hora_ini">
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09" selected>09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<select   id="minuto_ini" name="minuto_ini">
<option value="00">00</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="45"  selected>45</option>

<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>

              &nbsp;<span id='Buscando'></span>
              <label for="hora_final"><small>HORA INICIO</small></label>
            
               </p>

             
<select id="hora_fin" name="hora_fin">
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11"  selected>11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<select name="minuto_fin">
<option value="00">00</option>
<option value="15" selected>15</option>

<option value="30">30</option>

<option value="45">45</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
             <label for="hora_final"><small>HORA FIN</small></label>
            </p>
        <div style="text-align: center">
        <input type="hidden" name="id" value="" />
        <input type="hidden" name="estudiante_id" value="{$estudiantebuscado->id}" />
         <input type="hidden" name="proyecto_id" value="{$proyectobuscado->id}" />
          <input type="hidden" name="token" value="{$token}">
        <input type="hidden" name="salida_id" value="25" />
        <input type="submit"   name="tarea" value="Guardar"  class="sendme"  />
         </div>
          
 </form>
              
 </div>
<script>
jQuery('#hora_ini').change(function () {
var numero =document.getElementById("hora_ini").value; // valor de la id de Provincias
var minuto = jQuery(this).attr("minuto_ini"); // este es el atributo que nos ayuda a encontrar la población cuando modificamos  el contenido
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";
jQuery.ajax({
type: "POST", 
url: "buscarhora.php",
data: 'idnumero='+numero+'&minuto='+minuto, // enviamos la id de la Porvincia + la id de la población
success: function(a) {
jQuery('#hora_fin').html(a);// el resultado de la busqueda la mostramos en  #poblacionList
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script> 
              
               <script type="text/javascript">
        {literal} 
          $(function(){
            $('#fecha_defensa').datepicker({
              dateFormat:'dd/mm/yy',
         
              changeMonth: true,
              changeYear: true,
               minDate: new Date
             
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