{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ############ -->
      {include file="docente/columna.left.tpl"}
      <!-- ############ -->
   
      
      
      
      
      
<div id="content">
   <center> <strong> <h1>Lista de Respaldos</h1></strong></td></center>
      
<div>
    
 <form action="" method="post" id="consejo" >
               
<div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
   
 <form action="#" method="post" id="aprobado" name="aprobado" >

   <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
    <tr>
    <th><a >ID          </a></th>
    <th><a >FECHA</a></th>
    <th><a  >ARCHIVO    </a></th>
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
      <td>    <a href='{$listadocentes[ic][2]}' title=''       >{icono('basicset/data.png','Editar')} Archivo</a>
   
     </td>
       
    </tr>
   {/section}

    </tbody> 
</table>
     </div>
        <div style ="clear"></div>
       <div>
       
     
     
      
      <div style="text-align: center">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Sacar Respaldo">
        
     </div>
   </div>
 </form>

    </div>
<script type="text/javascript">

function marcar_desmarcar(){
var marca = document.getElementById('marcar');
var cb = document.getElementsByName('seleccion[]');
 
for (i=0; i<cb.length; i++){
if(marca.checked == true){
cb[i].checked = true
}else{
cb[i].checked = false;
}
}
}

</script>
<script type="text/javascript">



  jQuery(function(){
    $("#docentes tbody").on("click", "tr", function(event){
 if ($('#asignados > tbody >tr').length==3)
    {
     alert ( "Solo se Permiten tres Docentes como Tribunales!!" );
      } else
        {
      var  trid = $(this).attr('id'); // table row ID 
      
        var fila=     $(this).html()
                                       
                             $.ajax({
				url: 'verificar.php',
				type: "GET",
				data: "id="+trid,
				success: function(datos){
                               
                               if(datos=="1")
                               {
                                    $("#asignados").append('<tr>' +fila + '</tr>');
                                        $("#"+trid).remove(); 
                               }else
                               {
                                   alert(datos)
                               }
                                        
           
                             }
			});              
       
        
        }
        return false;
      
      
     
      
    
    
    });
  });
</script>


      </div>     
        <p>{$ERROR}</p>
  

    </div>
  </div>
</div>
{include file="footer.tpl"}