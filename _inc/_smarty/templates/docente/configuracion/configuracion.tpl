<div id="content">
  <form   id="form1" action="" method="post"  id="sitesearch">
    <h3>Agregue las &Aacute;reas que desea apoyar como tribunal</h3>
    <br/>
    <div  class='select-area'>
    <div class='span12'>
        <p>
        <label for="rol"><small>&Aacute;rea :</small></label>
            
      <select id='area_id'  name="area_id">
        {html_options values=$area_id output=$area_nombre selected=$areaselec_id}
      </select>&nbsp;<span id='Buscando'></span>
      <br />
      </p>
      <p>
      <label for="rol"><small>Sub &aacute;rea :</small></label>
      <select  class="select-style gender" name="sub_area_id" id="sub_area_id"  poblacioattri='' lang="10">
                    </select>&nbsp;<span id='subarea'></span>
                  
             </select>
      <br />
      </p>
    </div>
     
              <input type="hidden" name="ids"    value="{$apoyo->id}">
               <input type="hidden" name="token" value="{$token}">
    <input type="hidden" id="tarea" name="tarea" value="grabar" />
    <input type="submit" value="registro" />
     </div>
  </form></br>
      
      <table id="example"   width="100%"  style="width: 100%;">
					<thead>
						<tr role="row">
						<th  style="width: 125px;">Nro.</th>
                                                <th style="width: 200px;">&Aacute;rea</th>
                                                 <th style="width: 200px;">Sub-&Aacute;rea</th>
                                                   <th style="width: 200px;">Eliminar</th>
						</tr>
					</thead>

                                        <tbody>
        {section name=ic loop=$listadocentes}
    
    <tr  class="selectable" id="{$listadocentes[ic][0]}" >
   
      <td>{$listadocentes[ic][0]}
        <input type="hidden" name="ids[]" value="{$listadocentes[ic][0]}">
      </td>
      <td>
        {$listadocentes[ic][1]}
      </td>
       <td>
        {$listadocentes[ic][2]}
      </td>
      <td>    <a href='?action=eliminar&idapoyo={$listadocentes[ic][3]}' title=''       >Eliminar</a>
   
     </td>
         
    </tr>
   {/section}
                                             
                                        </tbody>
      </table>
</div>

<script>
jQuery('#area_id').change(function () {
var numero =document.getElementById("area_id").value;
var poblacio = jQuery(this).attr("poblacioattri");
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";
jQuery.ajax({
type: "POST", 
url: "cargar_subarea.php",
data: 'idnumero='+numero,
success: function(a) {
jQuery('#sub_area_id').html(a);
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script> 