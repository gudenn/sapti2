<div id="content">
  <form   id="form1" action="" method="post"  id="sitesearch">
    <h3>SELECIONE LAS &Aacute;REAS QUE DESEA APOYAR COMO TRIBUNAL</h3>
    <br/>
    <div  class='select-area'>
    <div class='span12'>
      <select id='custom-headers' multiple='multiple' name="myselect[]">
        {html_options values=$area_id output=$area_nombre selected=$areaselec_id}
      </select>
      <br />
    </div>
     
      
    <input type="hidden" id="tarea" name="tarea" value="grabar" />
    <input type="submit" value="registro" />
     </div>
  </form>
  <script>
    $('#custom-headers').multiSelect({
      selectableHeader: "<div class='custom-header'>SELECCIONE &Aacute;REAS</div>",
      selectionHeader: "<div class='custom-header'>&Aacute;REAS SELECCIONADAS</div>"
    });
  </script>
</div>

