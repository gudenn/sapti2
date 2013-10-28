      <div id="content">
        <div  class="notacontenido">
        <h1 class="title">Nota De Defensa</h1>
        <div id="respond">
          <form action="#" method="post" id="registro"  id="registro" name="registro" >
            <p>
                <label for="nombre de estudiante"><small>Nombre De Estudiante:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span><br/>
         
               <label for="nombre de proyecto"><small>Nombre De Proyecto:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               
               
                <label for="nombre de proyecto"><small>Objetivo General:</small></label>
                <span>{$proyecto->objetivo_general}</span><br/>
                <label for="nombre de proyecto"><small>Objetivo Específicos:</small></label>
                <span>{$proyecto->nombre}</span><br/>
                <label for="nombre de proyecto"><small>Descripción:</small></label>
                <span>{$proyecto->descripcion}</span><br/>
               
               </p>
            <br/>
           
            
        
            
              <p>
              <input type="text" name="nota_tribunal" id="nota_tribunal" value="{$tribunal->nota_tribunal}" size="22"/>
              <label for="Nota"><small>Ingrese la Nota  (*)</small></label>
            </p>
           
            
            <h2 class="title">Grabar  Nota</h2>
            <p>
               <input type="hidden" name="estudiante_id" value="{$estudiante->id}">
              <input type="hidden" name="proyecto_id" value="{$proyecto->id}">
              <input type="hidden" name="visto_bueno_id" value="{$usuario->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Grabar">
             
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
        
        
     <script type="text/javascript">
 $().ready(function() {	
	// Configuramos la validación de los distintos campos del formulario
	$("#registro").validationEngine({
		// Empezamos por las reglas
		  rules: {
			nota_tribunal: {  // Una cantidad entre un rango
				required: true,
				range: [1, 100]  // Aqui indico que no puede ser menor de 1 ni mayor de 100
			}	
		},
		messages: { // La segunda parte es configurar los mensajes, por lo que tengo que ir indicando para cada campo y cada regla el mensaje que quiero mostrar si no se cumple.
			
			nota_tribunal: {
				required: "Por favor, introduzca su calificacion",
				range: "Tiene que poner su Calificacion entre 1 y 100",
				
			},
		
		}
	});
});

</script>
        

        </div>
        </div>
        