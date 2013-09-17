      <h1 class="title">Lista de Eventos Registrados</h1>
      <p>
      <label for="search"><small>BUSQUEDA RAPIDA: </small></label>
      <input type="text" name="search" value="" id="id_search" placeholder="Palabra para la Busqueda..." autofocus style="width:250px;"/>
      </p>
<div  id="pagination_up" >{include file="docente/pagination.evento.tpl"}</div>
{include file=$lista}
<script type="text/javascript">
  {literal}
    $(document).ready(function() {
      $("#filtro_clear").submit(function(event) {
        $('#filtro').each(function(){
          this.reset();
        });
        event.preventDefault(); 
        var $form = $( this ),
        url       = $form.attr( 'action' );
        var sdata = $form.serialize();
        $('#tlista').load(url + '?clear=Limpiar&tlista=1', function(response, status, xhr) {
          $('#tlista').hide().fadeIn();
          if (status == "error") {
            var msg = "Sorry but there was an error: ";
            $("#error").html(msg + xhr.status + " " + xhr.statusText);
          }
        });
      });
      $("#filtro").submit(function(event) {
        event.preventDefault(); 
        var $form = $( this ),
        url       = $form.attr( 'action' );
        var sdata = $form.serialize();
        $('#tlista').load(url + '?' + sdata + '&tlista=1', function(response, status, xhr) {
          $('#tlista').hide().fadeIn();
          if (status == "error") {
            var msg = "Sorry but there was an error: ";
            $("#error").html(msg + xhr.status + " " + xhr.statusText);
          }
        });
      });
      $('.tajax').click(function() {
        $('#tlista').load($(this).attr('href') + '&tlista=1', function(response, status, xhr) {
          $('#tlista').hide().fadeIn();
          if (status == "error") {
            var msg = "Sorry but there was an error: ";
            $("#error").html(msg + xhr.status + " " + xhr.statusText);
          }
        });
        return false;
      });
    });
  {/literal}
</script>
<div  id="pagination_down" >{include file="docente/pagination.evento.tpl"}</div>
    <script type="text/javascript">
    $(function () {
    $('input#id_search').quicksearch('table tbody tr');
    });
    </script>