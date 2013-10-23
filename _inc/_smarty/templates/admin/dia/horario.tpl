      



<div id="content"  style="width:685px;min-height: 450px;">
       
        
             
              
              
          <form action="" method="post" id="registro" name="registro" >
          <h1 class="title">{$description}</h1>
           {$diass->llemartabla($iddocente)}
            <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Ingresar">
            </p>
          </form>
          <div  style="clear: both;" ></div>    
              
              
        {$ERROR}
      </div>
