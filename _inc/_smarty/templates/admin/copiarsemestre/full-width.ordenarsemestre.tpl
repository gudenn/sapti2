{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
      <h1 class="title">Ordenar Semestres</h1>
      <ul id="articulos"> 
  {section name=ic loop=$semestreorden}
  <tbody>
      <li class="marco-semestre" id="articulo-{$semestreorden[ic]['id']}">{$semestreorden[ic]['codigo']}</td></li>
  </tbody>
  {/section}
    </ul>

    <div class="msg"></div>
    </div>
    {$ERROR}
  </div>
  <script>
$(document).ready(function(){
	$("ul#articulos").sortable({ placeholder: "ui-state-highlight",opacity: 0.6, cursor: 'move', update: function() {
		var order = $(this).sortable("serialize");
		$.post("order.php", order, function(respuesta){
			$(".msg").html(respuesta).fadeIn("fast").fadeOut(2500);
		});
	}
	});
});
</script>
</div>
{include file="footer.tpl"}
<style type="text/css">

ul{
	list-style:none;
	margin:0;
	padding:0
}
.marco-semestre{
	display:block;
	background:#F6F6F6;
	border:1px solid #CCC;
	color:#3594C4;
	margin-top:3px;
	height:20px;
	padding:3px;
}
.ui-state-highlight{ background:#FFF0A5; border:1px solid #FED22F; height:25px;}
.msg{
	color:#0C0;
	font:normal 11px Tahoma
}

</style>