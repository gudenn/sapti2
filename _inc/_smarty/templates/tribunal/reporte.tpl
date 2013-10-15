
<form action="#" method="post" id="registro" name="registro" >
     <p>
              <select name="semestre_selec" id="semestre_selec" >
              {html_options values=$semestre_values selected=$semestre_selected output=$semestre_output}
              </select>
              <label for="semestre_selec"><small>Seleccione Semestre(*)</small></label>
            </p>
            
            
            <h2 class="title">Generar </h2>
            <p>
              <input type="hidden" name="usuario_id"    value="{$usuario->id}">
              <input type="hidden" name="estudiante_id" value="{$estudiante->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Generar">
             </p>
          </form>
   <script type="text/javascript">
         
            var chart;
            $(document).ready(function() {
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'container6',
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: 'Estadisticos Diagrama  de Tortas'
                    },
                    tooltip: {
                        formatter: function() {
                            return '<b>'+ this.point.name +'</b>: '+ this.y +' %';
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Browser share',
                        data: [
                            ['Tribunles', {$tri}],
                            ['Defensa',    {$def}],
                            ['Defensa Privada', {$dp}],
                            ['Defensa Publica',    {$pu}],
                            
                           
                        ]
                    }]
                });
            });
                 
        </script>
         <div id="container6" style="width: 800px; height: 400px; margin: 0 auto"></div>
  
  <p>{$ERROR}</p>
