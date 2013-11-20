{include file="modelo_carta/header.tpl"}
<form action="carta.imprimir.php" method="POST" name="imprimir">
  <div class="wrapper row3">
    <div class="rnd">
      <div id="container">
        <div style="clear: both"></div>
        {$template}
        <div style="clear: both"></div>
        <input type="submit" value="Imprimir" class="myButton" />
        <input type="hidden" name="carta_id" value="{$carta->id}" />
      </div>
    </div>
  </div>
</form>
</body>
</html>