    <div id="content" style="width:685px;min-height: 450px;">
        <div id="conteni">
            <h1 class="title">Estudiantes Inscritos</h1>
            <table class="tbl_lista_inscrito">
              <thead>
                <tr>
                  <th><a>C&Oacute;DIGO SIS      </a></th>
                  <th><a>APELLIDOS Y NOMBRES          </a></th>
                </tr>
              </thead>
              {section name=ic loop=$inscritos}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$inscritos[ic]['codigosis']}</td>
                  <td>{$inscritos[ic]['nombre']}</td>
                </tr>
              </tbody>
              {/section}
            </table>
            <h2 class="title">Estudiantes Actualizados</h2>
            <table class="tbl_lista_yainscrito">
              <thead>
                <tr>
                  <th><a>C&Oacute;DIGO SIS      </a></th>
                  <th><a>APELLIDOS Y NOMBRES          </a></th>
                </tr>
              </thead>
              {section name=ic loop=$yainscritos}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$yainscritos[ic]['codigosis']}</td>
                  <td>{$yainscritos[ic]['nombre']}</td>
                </tr>
              </tbody>
              {/section}
            </table>
            <h3 class="title">Estudiantes Nuevos Al Sistema</h3>
            <table class="tbl_lista_noestu">
              <thead>
                <tr>
                  <th><a>C&Oacute;DIGO SIS      </a></th>
                  <th><a>APELLIDOS Y NOMBRES          </a></th>
                </tr>
              </thead>
              {section name=ic loop=$noestudiante}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$noestudiante[ic]['codigosis']}</td>
                  <td>{$noestudiante[ic]['nombre']}</td>
                </tr>
              </tbody>
              {/section}
            </table>
            <h3 class="title">Estudiantes Borrados</h3>
            <table class="tbl_lista_noestu">
              <thead>
                <tr>
                  <th><a>C&Oacute;DIGO SIS      </a></th>
                  <th><a>APELLIDOS Y NOMBRES          </a></th>
                </tr>
              </thead>
              {section name=ic loop=$borradoestudiante}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$borradoestudiante[ic]['codigosis']}</td>
                  <td>{$borradoestudiante[ic]['nombre']}</td>
                </tr>
              </tbody>
              {/section}
            </table>
            <h3 class="title">Lineas Con Error</h3>
            <table class="tbl_lista_noestu">
              <thead>
                <tr>
                  <th><a>Linea      </a></th>

                </tr>
              </thead>
              {section name=ic loop=$errorestudiante}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$errorestudiante[ic]['linea']}</td>

                </tr>
              </tbody>
              {/section}
            </table>
            <h3 class="title">Total de Registros Procesados:{$total}</h3>
        </div>
        <p>{$ERROR}</p>
      </div>
