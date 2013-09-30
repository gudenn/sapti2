      <div id="content">
        <h1 class="title">TITULO":

            <i>{$proyecto->nombre}</i>"</h1>
        <div id="respond">
         
             <p>
              <label for="nombre"><small>NUMERO:</small></label>
            <span>{$proyecto->numero_asignado}</span>
            
          </p>
          <p>
              <label for="nombre"><small>AUTOR:</small></label>
            <span>{$usuario->nombre}</span>
            <span>{$usuario->apellido_paterno}</span>
            <span>{$usuario->apellido_materno}</span>
            
          </p>
         
          <p>
              <label for="area"><small>AREA:</small></label>
            <span>{$nombre_a}</span>
            
          </p>
          <p>
              <label for="email"><small>SUB_AREA:</small></label>
                 <span>{$sub_area}</span>
            
          </p>
          
          <p>
              <label for="email"><small>MODALIDAD:</small></label>
            <span>{$modalidad}</span>
           
          </p>
         
          <p>
              <label for="email"><small>CARRERA:</small></label>
            <span>{$carrera}</span>
           
          </p>
          <p>
              <label for="email"><small>TUTOR:</small></label>
            <span>{$tutor}</span>
           
          </p>
          <p>
              <label for="email"><small>FORMULARIO:</small></label>
            <span>{$formulario}</span>
           
         
          
             
          
        </div>
            <div>
                <p>
             <h1 class="title">OBJETIVO GENERAL:</h1>
             <p><span>{$proyecto->objetivo_general}</span></p>
            </p>
           </div>
            <div>
<p>
                <h1 class="title">OBJETIVOS ESPECIFICOS</h1>
                
                 <table class="tbl_lista" id="docentes"  mane="docentes">
     <tbody>                  
            {section name=ic loop=$listadocentes}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
        <td>{$listadocentes[ic]['descripcion']}</td>
       
      
     
    
     </tr>
    
    
            {/section}
              </tbody> 
              </table>
          </p>
            </div>
            <div>
                <h1 class="title">DESCRIPCION:</h1>
                <p>
              
            <span>{$proyecto->descripcion}</span>
           
          </p>
            </div>
        <p>{$ERROR}</p>
      </div>
        