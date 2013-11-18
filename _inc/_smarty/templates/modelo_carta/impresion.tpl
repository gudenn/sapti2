<!DOCTYPE HTML>
<html  lang="es">
  <head>
    <title>{$title}</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="shortcut icon" alt= "SAPTI UMSS" href="{$URL_IMG}favicon.ico"  />

    <meta name="description" content="{$description}" />
    <meta name="keywords" content="{$keywords}" />

    {section name=css_i loop=$CSS}
      <link rel="stylesheet" href="{$CSS[css_i]}" type="text/css" />
    {/section}

    {section name=js_i loop=$JS}
      <script type="text/javascript" src="{$JS[js_i]}"></script>
    {/section}

</head>
<body id="top">
  <div class="wrapper row3">
    <div class="rnd">
      <div id="container">
        <div style="clear: both"></div>
        {$template}
        <div style="clear: both"></div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
    window.print();
  </script>
</body>
</html>