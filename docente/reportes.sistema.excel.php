<?php
require('_start.php');

//Exportar datos de php a Excel
header("Content-Type: application/vnd.ms-excel");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=proceso.xls");

echo "<HTML LANG='es'>
<TITLE>::. Exportacion de Datos .::</TITLE>
</head>
<body>";

$sql = $queEmp = $_GET['sql'];
$b=1;
DesplegarTabla($sql,$b);

function DesplegarTabla($a,$b)
     {
        $query =  mysql_query($a);
        echo "<table BORDER=1 align='center' CELLPADDING=1 CELLSPACING=1><thead><tr>";
        echo "<th width='50%' style='background-color:#006; text-align:center; color:#FFF'><strong>Numero</strong></th>";
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    echo "<th width='50%' style='background-color:#006; text-align:center; color:#FFF'><strong>".mysql_field_name($query,$i)."</strong></th>";
                }
                echo "</thead></tr>";
        while ($row=mysql_fetch_assoc($query)) {
            echo "<tr class=''>";
            echo "<td>".$b."</td>";
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    echo "<td>".$row[mysql_field_name($query,$i)]."</td>";
                }
            echo "</tr>";
            $b++;
        }    
        echo "</table>
              </body>
              </html>";
    }
?>