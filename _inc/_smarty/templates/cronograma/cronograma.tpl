<div id="calendarioprincipal"></div>
<script type="text/javascript">
  {literal}
  $(document).ready(function() {
    $("#calendarioprincipal").eventCalendar({
  {/literal}
      eventsjson: '{$URL}cronograma/eventos.json.php',
  {literal}
      eventsScrollable: true,
    monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
      "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
    dayNames: [ 'Domingo','Lunes','Martes','Miércoles',
      'Jueves','Viernes','Sabado' ],
    dayNamesShort: [ 'Dom','Lun','Mar','Mie', 'Jue','Vie','Sab' ],
    txt_noEvents: "No hay Eventos para esta fecha",
    txt_SpecificEvents_prev: "",
    txt_SpecificEvents_after: "Eventos:",
    txt_next: "siguiente",
    txt_prev: "anterior",
    txt_NextEvents: "Proximos Eventos:",
    txt_GoToEventUrl: "Ver detalle",
    showDescription: true,
    openEventInNewWindow: true,
    //eventsLimit: 10,
    jsonDateFormat: 'human',
    cacheJson: false
    });
  });
  {/literal}
</script>