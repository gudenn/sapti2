
<form action="#" method="post" id="registro" name="registro" >
    
            
            <h2 class="title">Generar </h2>
            <p>
             
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
                        text: 'Diagrama  de Tortas'
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
                            ['Postergado', {$pos}],
                            ['Prórroga',    {$pr}],
                            
                            ['Cambios',   {$cam} ],
                            
                            ['Vencidos',  {$v}],
                            
                        ]
                    }]
                });
            });
                 
        </script>
         <div id="container6" style="width: 800px; height: 400px; margin: 0 auto"></div>
  
  <p>{$ERROR}</p>
