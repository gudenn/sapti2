      <div id="right_column">
          <h2 class="title">Calendario de Eventos</h2>
            <div id="calendariosalidas"></div>
        <script type="text/javascript">
        {literal}
          $(document).ready(function() {
            $("#calendariosalidas").eventCalendar({
              eventsjson: 'json/eventos.json.php',
              jsonDateFormat: "human",
              eventsScrollable: true,
              monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
              dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles',
                'Jueves', 'Viernes', 'Sabado'],
              dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
              txt_noEvents: "No hay Eventos para esta fecha",
              txt_SpecificEvents_prev: "",
              txt_SpecificEvents_after: "Eventos:",
              txt_next: "siguiente",
              txt_prev: "anterior",
              txt_NextEvents: "Próximos Eventos:",
              eventsLimit: 10,
              cacheJson: false
            });
          });
        {/literal}
      </script>
      </div>
        