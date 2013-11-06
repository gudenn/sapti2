      <div id="content">
        <h1 class="title">Registro de Docentes</h1>
        <p>Formulario de registro de Docentes</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <textarea name="cvs" id="cvs" rows="4" cols="60" style="width: 431px;height: 305px;" data-validation-engine="validate[required]"></textarea>
            </p>
            <p>
              <label for="cvs"><small>Ingrese Contenido CSV (*)</small></label>
            </p>
            <h2 class="title">Grabar Docentes</h2>
            <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Limpiar">
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
      </div>
        