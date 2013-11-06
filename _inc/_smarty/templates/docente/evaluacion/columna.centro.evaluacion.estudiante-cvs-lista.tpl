    <div id="content" style="width:685px;min-height: 450px;">
        <div id="conteni">
            <h1 class="title">Estudiantes Inscritos</h1>
            <table class="tbl_lista_inscrito">
              <thead>
                <tr>
                  <th><a>CODIGO SIS             </a></th>
                  <th><a>APELLIDOS Y NOMBRES     </a></th>
                  <th><a>EVALUACIN 1           </a></th>
                  <th><a>EVALUACION 2           </a></th>
                  <th><a>EVALUACION 3           </a></th>
                </tr>
              </thead>
              {section name=ic loop=$inscritos}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$inscritos[ic]['1']}</td>
                  <td>{$inscritos[ic]['2']}</td>
                  <td>{$inscritos[ic]['3']}</td>
                  <td>{$inscritos[ic]['4']}</td>
                  <td>{$inscritos[ic]['5']}</td>
                </tr>
              </tbody>
              {/section}
            </table>
            <h3 class="title">Estudiantes No Encontrados</h3>
            <table class="tbl_lista_noestu">
              <thead>
                <tr>
                  <th><a>CODIGO SIS             </a></th>
                  <th><a>APELLIDOS Y NOMBRES     </a></th>
                  <th><a>EVALUACION 1           </a></th>
                  <th><a>EVALUACION 2           </a></th>
                  <th><a>EVALUACION 3           </a></th>
                </tr>
              </thead>
              {section name=ic loop=$noestudiante}
              <tbody>
                <tr  class="{cycle values="light,dark"}">
                  <td>{$noestudiante[ic]['1']}</td>
                  <td>{$noestudiante[ic]['2']}</td>
                  <td>{$noestudiante[ic]['3']}</td>
                  <td>{$noestudiante[ic]['4']}</td>
                  <td>{$noestudiante[ic]['5']}</td>
                </tr>
              </tbody>
              {/section}
            </table>
        </div>
        <p>{$ERROR}</p>
      </div>
