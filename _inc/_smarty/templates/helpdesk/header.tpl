<!DOCTYPE HTML>
<html  lang="es">
  <head>
    <title>{$title}</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="shortcut icon" alt= "SAPTI UMSS" href="{$URL_IMG}favicon.ico"  />

    <meta name="description" content="{$description}" />
    <meta name="keywords" content="{$keywords}" />

    <link rel="stylesheet" href="{$URL_CSS}academic/layout.css" type="text/css" />
    {section name=css_i loop=$CSS}
      <link rel="stylesheet" href="{$CSS[css_i]}" type="text/css" />
    {/section}

    {section name=js_i loop=$JS}
      <script type="text/javascript" src="{$JS[js_i]}"></script>
    {/section}

</head>
<body id="top">
<div class="wrapper row1">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1>
        <a href="{$URL}">{icono('SAPTI_241x58.png','SAPTI','241px','58px')}</a>
      </h1>
    </div>
    <div class="fl_right" style="padding-top: 8px;">
      <form action="#" method="post" id="sitesearch">
        <fieldset>
          <input type="text" value="Buscar en Ayuda" onfocus="this.value=(this.value=='Buscar en Ayuda')? '' : this.value ;" style="width: 130px;"  />
          <input type="image" src="{$URL_IMG}icons/Search.png" id="search" alt="Search" />
        </fieldset>
      </form>
    </div>
  </div>
</div>
{include file="helpdesk/menu.topnav.tpl"}
