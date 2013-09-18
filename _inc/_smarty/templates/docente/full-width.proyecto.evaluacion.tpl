{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Registro de Evaluaciones</h1>
            <p>
               <label for="nombre de proyecto"><small>NOMBRE DE PROYECTO:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>NOMBRE DE ESTUDIANTE:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span>
            </p>
        <div id="wrap">
        <div id="message"></div>
        	<div id="pagecontrol">
		<label for="pagecontrol">Filas por Pagina: </label>
		<select id="pagesize" name="pagesize">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="25">25</option>
                    <option value="30">30</option>
                    <option value="40">40</option>
                    <option value="50">50</option>
                </select>

                </div>
        	<label for="filter">Busqueda Rapida :</label>
		<input type="text" id="filter"/>
        
		<div id="tablecontent"></div>
        
        	<div id="paginator"></div>

        <h1 class="title">Evaluaciones</h1>
        <form action="#" method="post" id="registro" name="registro" onSubmit="return acti();">
        <table class="tbl_lista">
              <thead>
                <tr>
                  <th>Evalucion 1    </th>
                  <th>Evalucion 2    </th>
                  <th>Evalucion 3    </th>
                  <th>Promedio       </th>
                  <th>Editar         </th>
                  <th>Registrar      </th>
                </tr>
              </thead>
            <tr class="dark">
               <th>
                   <input type="number" name="evaluacion_1" id="evaluacion_1" value="{$evaluacion->evaluacion_1}" disabled="disabled" onkeyup="promedio.value = Math.round(((parseInt(evaluacion_1.value) + parseInt(evaluacion_2.value) + parseInt(evaluacion_3.value))/3)* 1) / 1" onkeypress="return validarNro(event)" min=0 max=100>
               </th>
               <th>
                   <input type="number" name="evaluacion_2" id="evaluacion_2" value="{$evaluacion->evaluacion_2}" disabled="disabled" onkeyup="promedio.value = Math.round(((parseInt(evaluacion_1.value) + parseInt(evaluacion_2.value) + parseInt(evaluacion_3.value))/3)* 1) / 1" onkeypress="return validarNro(event)" min=0 max=100>
               </th>
               <th>
                   <input type="number" name="evaluacion_3" id="evaluacion_3" value="{$evaluacion->evaluacion_3}" disabled="disabled" onkeyup="promedio.value = Math.round(((parseInt(evaluacion_1.value) + parseInt(evaluacion_2.value) + parseInt(evaluacion_3.value))/3)* 1) / 1" onkeypress="return validarNro(event)" min=0 max=100>
               </th>
               <th>
                   <input type="text" name="promedio" id="promedio" value="{$evaluacion->promedio}" readonly>
               </th>
               <th>
                   <input type="button" onClick="activar(this)" value="Editar">
               </th>
               <th>
                   <input type="hidden" name="tarea" value="registrar">
                   <input type="hidden" name="token" value="{$token}">
                   <input name="submit" type="submit" id="submit" value="Grabar">
               </th>
            </tr>
        </table>
        </form>       
        </div>
        <p>{$ERROR}</p>
     </div>
    {$ERROR}
    </div>
</div>
{include file="footer.tpl"}
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.revision.lista.php?doc={$proyecto->id}");
        </script>
        <script type="text/javascript">
            function activar(bott){
            if(bott.value == 'Editar'){
            bott.value = 'No Editar';
            document.getElementById('evaluacion_1').disabled = false;
            document.getElementById('evaluacion_2').disabled = false;
            document.getElementById('evaluacion_3').disabled = false;
            }else{
            bott.value = 'Editar';
            document.getElementById('evaluacion_1').disabled = 'disabled';
            document.getElementById('evaluacion_2').disabled = 'disabled';
            document.getElementById('evaluacion_3').disabled = 'disabled';
            }
            }
            function acti(){
            document.getElementById('evaluacion_1').disabled = false;
            document.getElementById('evaluacion_2').disabled = false;
            document.getElementById('evaluacion_3').disabled = false;
            return confirm('Seguro desea modificar la evaluacion?');
            }
            function validarNro(e) {
            var key;
            if(window.event) // IE
                    {
                    key = e.keyCode;
                    }
            else if(e.which) // Netscape/Firefox/Opera
                    {
                    key = e.which;
                    }

            if (key < 48 || key > 57)
                {
                if(key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
                    { return true; }
                else 
                    { return false; }
                }
            return true;
            }
        </script>
        <style type="text/css">
        tr:nth-child(even) { background: #ddd }
        tr:nth-child(odd) { background: #fff}
        table {
        color: #666666;
        }
        </style>