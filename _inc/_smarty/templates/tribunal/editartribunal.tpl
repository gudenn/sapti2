 <div id="content">

    <center> <strong>Editando</strong></td></center>
     
          
     <form action="" method="post">
      <h1> Detalle</h1>
        
       <label for="nombre">Estudiante:  {$usuario->getNombreCompleto()}</label><br />
       <label for="nombre">C&oacute;digo Sis:  {$estudiante->codigo_sis}</label><br />
       <label for="nombre">Proyecto:  {$proyecto->nombre}</label><br />
           
   
 </form>

    <hr>
       
           
<div >
   <label  style="font-size: 13px; color: black;"for="txtBuscar">Buscar: </label>
     <input  style="width: 590px; height: 30px; color: #000;" type="search" id="txtBuscar" name="txtBuscar" placeholder="Digite el nombre que desea encontrar. Para cancelar presione  la tecla ESCAPE."></br>
                    <p style="color: black; font-size: 13px;"> Lista de Docentes</p>  
  
   <div  style='height: 200px; width: 100%; font-size: 12px; overflow: auto;'>
   
    <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
  <tr>
    <th><a >ID          </a></th>
    <th><a >NOMBRE      </a></th>
    <th><a  >APELLIDOS    </a></th>
    <th><a >&Aacute;REA</a></th>
  <th><a >AGREGAR</a></th>
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
  <td>     <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocentes[ic][3]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}<br />
  {/foreach}
{/foreach}
 </span> 
        
       </a>
</td>
  <td><div id="1{$listadocentes[ic][0]}">
     <img src="{$URL}images/add.png" border="1" alt="Agregar" width="30">
      </div>
     </td>
    </tr>
  {/section}
    </tbody> 
</table>
   </div>          
    
      
       <form action="" method="post" id="pedido_form" >
 <div  >
   <Hi> Lista de Docentes Asignados</Hi>
     
      
       <table  multiple id="asignados" >
        <thead>
          <tr>
            <th>ID          </th>
            <th>NOMBRE   </th>
            <th>APELLIDOS </th>
             <th>&Aacute;REA</th>
           <th>QUITAR</th>
           
          </tr>
        </thead>
        <tbody>
   {section name=ic loop=$listadocenteselec}
   
    <tr  class="selectable">
   
      <td>{$listadocenteselec[ic][0]}
        <input type="hidden" name="ids[]" value="{$listadocenteselec[ic][0]}">
      </td>
      <td>
        {$listadocenteselec[ic][1]}
      </td>
      <td>{$listadocenteselec[ic][2]}</td>
  <td>     <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocenteselec[ic][3]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}<br />
  {/foreach}
{/foreach}
 </span> 
        
       </a>
</td>
  <td>
       <div id="1{$asignados[ic][0]}">
       <img src="{$URL}images/remove.png" border="1" alt="Agregar" width="30">
         </div>
       </td>
    </tr>
  {/section}
        </tbody>
      </table>
        
     
      <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyecto->id}" />
       <input type="hidden" id="proyecto_id" name="estudiante_id" value="{$estudiantebuscado->codigo_sis}" />
      
        </div>
       <div style ="clear:both;"></div>
     
        <div>
        Mensaje<br/>
        <textarea name="detalle" rows="5" style="width: 90%">
Se le Asigno los Tribunales  correspondientes al proyecto: {$proyecto->nombre}  del estudiante: {$usuario->getNombreCompleto()} para que usted realice las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta. 
      </textarea>
        <script>
          CKEDITOR.replace('detalle'{$editores})
        </script>
      </div>
         
      
      <div style="text-align: center">
        <input type="hidden" name="id" value="" />
        <input type="hidden" name="salida_id" value="25" />
        <input type="submit" value="grabar" name="tarea" class="sendme"  />
         
 
      </div>
 
 </form>
    </div>
<script type="text/javascript">
   
    //cali rojas
//lewebmonster.com
 
$(function(){
//funcion para buscar en una tabla con jQuery
    $.fntBuscarEnTabla=function(strCadena,strIDdeTabla){
        //seleccionamos la tabla en la que vamos a buscar
        var $objTabla=$('#'+strIDdeTabla);
        //eliminamos la fila temporal que contiene una leyenda cuando
        //la busqueda no devuelve resultados
        $objTabla.find('#trFilaConMensaje').remove();
         
        //iteramos en todas las filas del body de la tabla
        $objTabla.find('tbody tr').each(function(iIndiceFila,objFila){
            //obtenemos todas las celdas de la fila
            var $objCeldas=$(objFila).find('td');
             
            //verificamos que la fila tenga celdas
            if($objCeldas.length>0){
                var blnLaCadenaExiste=false;
                //recorremos todas las celdas de la fila actual
                $objCeldas.each(function(iIndiceCelda,objCeldaFila){
                    //limpiamos la cadena que el usuario esta buscando (de caracteres que puedan chocar con
                    //codigo JavaScript, lo cual genera un error en runtime)
                    var objRegEx=new RegExp(RegExp.escape(strCadena),'i');
                    //comparamos si la cadena buscada esta en la celda
                    if(objRegEx.test($(objCeldaFila).text())){
                        //indicamos que hemos encontrado la cadena
                        blnLaCadenaExiste=true;
                        //salimos del bucle (el de las celdas o columnas)
                        return false;
                    }
                });
                //si la cadena fue encontrada, entonces mostramos el contenido de la fila,
                //sino, se oculta la fila por completo
                if(blnLaCadenaExiste===true)$(objFila).show();else $(objFila).hide();
            }
        });
         
        //si no hay resultados agregamos una fila temporal para decirle al usuario que
        //no hemos encontrado lo que busca
        if($objTabla.find('tbody tr:visible').length==0){
            //obtenemos la cantidad de columnas para hacer un colspan
            var iColumnas=$objTabla.find('tbody tr:first-child td').length;
            //agregamos al cuerpo de la tabla la fila con el mensaje            
                $('<tr>',{
                    id: 'trFilaConMensaje'
                }).append(
                    //agregamos a la fila una celda con el mensaje
                    $('<td>',{
                        colspan: iColumnas,
                        align: 'center',
                        html: '<em>No hay resultados, intente otra b&uacute;squeda</em>'
                    })
                ).appendTo($objTabla.find('tbody'));
        }
    }
     
//extendemos RegEx y agregamos un metodo que nos permita limpiar los caracteres
//que el usuario busca en la tabla, esto es para evitar errores de sintaxis en
//tiempo de ejecucion
    RegExp.escape=function(strCadena){
        var strCaracteresEspeciales=new RegExp("[.*+?|()\\[\\]{}\\\\]", "g");
        //devolvemos la cadena limpia
        return strCadena.replace(strCaracteresEspeciales, "\\$&");
    };
     
//hacemos la busqueda en el evento search del control de busqueda
    $('#txtBuscar').on('search',function(){
        //le decimos a la funcion que busque en la tabla tblTabla el
        //valor que contiene el campo actual
        $.fntBuscarEnTabla($(this).val(),'docentes');
    });

$("#txtBuscar").keyup(function(){
    $.fntBuscarEnTabla($(this).val(),'docentes');
}); 
});
</script>

<script type="text/javascript">



  jQuery(function(){
    $("#docentes tbody").on("click", "tr", function(event){
 if ($('#asignados > tbody >tr').length==3)
    {
     alert ( "Solo se Permiten tres Docentes como Tribunales!!" );
      } else
        {
            
        var contenido='';
        var conta=0;
        var iddocente=0;
        var tamani=$(this).find('td').length-1;
        $(this).find('td').each(function(){
            if(conta < tamani)
            {
             
                contenido=contenido+'<td>'+$(this).html() +'</td>';
                
           
            }
             else{
             contenido= contenido+'<td> '+'<img src="{$URL}images/remove.png" border="1" alt="Agregar" width="30">'+'</td>';
            }
  
         conta++;
        });
        var docenteId = $(this).find("td:first").text(); 

        var fila=     $(this).html();
         $("#"+docenteId).remove(); 
                                 $.ajax({
				url: 'verificar.php',
				type: "GET",
				data: "id="+docenteId,
				success: function(datos){
                               
                               if(datos=="1")
                               {
                                   
  
                      
                                    $("#asignados").append('<tr id="'+docenteId+'" >' +contenido + '</tr>');
                                    
                                    $("#"+docenteId).remove(); 
                                        
                               }else
                               {
                                   alert(datos);
                               }
                                        
           
                             }
			});              
       
        
        }
        return false;
      
      
     
      
    
    
    });
  });
</script>


<script type="text/javascript">

  jQuery(function(){
    $("#asignados tbody").on("click", "tr", function(event){
 var docenteId =parseInt($(this).find("td:first").text()); 
        var contenido='';
        var conta=0;
        var tamani=$(this).find('td').length-1;
        $(this).find('td').each(function(){
            if(conta < tamani)
            {
                  
                 contenido=contenido+'<td>'+$(this).html()+'</td>';
            
            }
             else{
             contenido= contenido+'<td>'+'<img src="{$URL}images/add.png" border="1" alt="Agregar" width="30">'+'</td>';
            }
  
         conta++;
        });
      
      $("#docentes tbody").append('<tr class="selectable" id="'+docenteId+'" >' +contenido + '</tr>');
    
      $(this).remove();
      return false;
    });
  });


</script>
</div>