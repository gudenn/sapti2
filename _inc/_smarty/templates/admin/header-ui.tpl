<!DOCTYPE HTML>
<html  lang="es">
  <head>
    <title>{$title}</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />

    <meta name="description" content="{$description}" />
    <meta name="keywords" content="{$keywords}" />

    <!-- CSS -->
    <link rel="stylesheet" href="{$URL_CSS}academic/layout.css" type="text/css" />
    <link rel="stylesheet" href="{$URL_CSS}dashboard.css" type="text/css" />
    <link rel="stylesheet" href="{$URL_CSS}academic/3_column.css" type="text/css" />
    <!-- jQuery -->
    <script type="text/javascript" src="{$URL_JS}jquery.min.js"></script>
    <!-- Datepicker & Tooltips $ Dialogs UI -->
    <link rel="stylesheet" href="{$URL_JS}ui/cafe-theme/jquery-ui-1.10.2.custom.min.css" type="text/css" />
    <script type="text/javascript" src="{$URL_JS}jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="{$URL_JS}ui/i18n/jquery.ui.datepicker-es.js"></script>
    <!-- Validation -->
    <link rel="stylesheet" href="{$URL_JS}validate/validationEngine.jquery.css" type="text/css" />
    <script type="text/javascript" src="{$URL_JS}validate/idiomas/jquery.validationEngine-es.js"></script>
    <script type="text/javascript" src="{$URL_JS}validate/jquery.validationEngine.js"></script>
    <!-- BOX -->
    <link rel="stylesheet" href="{$URL_JS}box/box.css" type="text/css" />
    <script type="text/javascript" src="{$URL_JS}box/jquery.box.js"></script>
    
    <!-- Extras -->
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
    {include file="admin/menu.up.derecha.tpl"}
  </div>
</div>
{include file="admin/menu.topnav.tpl"}
