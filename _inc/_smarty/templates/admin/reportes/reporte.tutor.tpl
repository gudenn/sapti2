

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
                            ['Tutores Proyectos Aceptados', {$ac}],
                            ['Tutores Proyectos Rechazados',    {$pr}],
                            
                            
                            
                        ]
                    }]
                });
            });
                 
        </script>
         <div id="container6" style="width: 800px; height: 400px; margin: 0 auto"></div>
  
  <p>{$ERROR}</p>
