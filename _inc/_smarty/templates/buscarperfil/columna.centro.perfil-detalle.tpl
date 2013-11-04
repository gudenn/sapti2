      <div id="content">
        <h1 class="title">T&Iacute;TULO":

            <i>{$proyecto->nombre}</i>"</h1>
        <div id="respond">
         
             <p>
              <label for="nombre"><small>N&Uacute;MERO:</small></label>
            <span>{$proyecto->numero_asignado}</span>
            
          </p>
          <p>
              <label for="nombre"><small>AUTOR:</small></label>
            <span>{$usuario->nombre}</span>
            <span>{$usuario->apellido_paterno}</span>
            <span>{$usuario->apellido_materno}</span>
            
          </p>
          <p>
             <label for="nombre"><small>TUTOR:</small></label>
              <table class="tbl_lista" id="docentes"  mane="docentes">
           <td id="lista_tutores" style="height: 29px;padding-left: 40px">
                {section name=tutor start=0 loop=$tutores}
                   {$tutores[tutor]->getNombreCompleto()}<br>
                {/section}
              
          </td>
          </table>
          </p>
         
          <p>
              <label for="area"><small>&Aacute;REA:</small></label>
            <span>{$area}</span>
            
          </p>
         
          
          <p>
              <label for="email"><small>MODALIDAD:</small></label>
            <span>{$modalidad}</span>
           
          </p>
         
          <p>
              <label for="email"><small>CARRERA:</small></label>
            <span>{$carrera}</span>
           
          </p>
         
        </div>
            <div>
                <p>
             <h1 class="title">OBJETIVO GENERAL:</h1>
             <p><span>{$proyecto->objetivo_general}</span></p>
            </p>
           </div>
            <div>
<p>
                <h1 class="title">OBJETIVOS ESPEC&Iacute;FICOS</h1>
                
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
                <h1 class="title">DESCRIPCI&Oacute;N:</h1>
                <p>
              
            <span>{$proyecto->descripcion}</span>
           
          </p>
            </div>
        <p>{$ERROR}</p>
      </div>
        