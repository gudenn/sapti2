<?php
  define ("MODULO", "DOCENTE");
  require('_start.php');
    if(!isDocenteSession())
    header("Location: ../login.php");

$materia=$_POST['materia'];
$tiporeporte=$_POST['tiporeporte'];
$evaluacion=$_POST['evaluacion'];

$var=0;
  function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
           
               return $tmp;
           };

function selectmuestra($mat,$eva){
    $ab="";
    if($mat!='')
        $ab.="
            es.codigo_sis as Codigo_Sis, CONCAT(us.nombre,' ',us.apellido_paterno,' ',us.apellido_materno) as Estudiante, pro.nombre as Nombre_Proyecto";
    if($eva==1)
        $ab.="
            , eva.promedio as Promedio";
    return $ab;
}
function wheremuestra($mat,$sem,$eva){
    $ac="";
    if($mat!='')
    $ac.="
        AND di.id=".$mat."";
    if($sem=='2')
    $ac.="
        AND eva.promedio >='51'";
    return $ac;
}
function consulta($mat,$sem,$eva){
    $sql="SELECT ".selectmuestra($mat,$sem)."
  FROM estudiante es, usuario us, materia ma, inscrito ins, dicta di, proyecto pro, proyecto_estudiante proes, evaluacion eva, semestre se
 WHERE es.usuario_id=us.id
 AND eva.id=ins.evaluacion_id
 AND proes.estudiante_id=es.id
 AND proes.proyecto_id=pro.id
 AND ins.estudiante_id=es.id
 AND ins.dicta_id=di.id
 AND di.materia_id=ma.id 
 AND di.semestre_id=se.id
 AND se.activo=1
".wheremuestra($mat,$sem,$eva)."";
    return $sql;
}
if ($materia!=''&&$tiporeporte!='') {
    MysqlFunciones::DesplegarTabla(consulta($materia,$tiporeporte,$evaluacion), $var, $materia,$tiporeporte);
}else{
    echo 'Por favor Seleccione una Opcion para Generar el Reporte...';
}
function classtabla($va){
    $clas='light';
    if($va%2 == 0){
    $clas='dark';    
    }
    return $clas;
};

class MysqlFunciones{
    public static function DesplegarTabla($a,$b,$mat,$tre)
     {
        $query =  mysql_query($a);
        echo "<table class='tbl_lista'><thead><tr>";
        echo "<th>Nº</th>";
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    echo "<th>".mysql_field_name($query,$i)."</th>";
                }
                echo "</thead>";
        while ($row=mysql_fetch_assoc($query)) {
            echo "</tr><tr class=".classtabla($b).">";
            echo "<td>".($b+1)."</td>";
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    echo "<td>".$row[mysql_field_name($query,$i)]."</td>";
                }
            echo "</tr>";
            $b++;
        }    
        echo "</table>";
    echo "<center> 
    <a href='reportes.sistema.pdf.php?tre=".$tre."&iddicta=".$mat."' target='_blank'><img src='../images/icons/filepd.png' border='0' alt='pdf' title='Descargar PDF'/>Descargar PDF</a>
    <a href='reportes.sistema.excel.php?tre=".$tre."&iddicta=".$mat."' target='_blank'><img src='../images/icons/excel.png' border='0' alt='exel' title='Descargar EXCEL'/>Descargar EXCEL</a>
    </center>";
    }
}
exit;

?>