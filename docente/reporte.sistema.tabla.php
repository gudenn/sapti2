<?php
  define ("MODULO", "DOCENTE");
  require('_start.php');

$materia=$_POST['materia'];
$semestre=$_POST['semestre'];
$evaluacion=$_POST['evaluacion'];

$var=0;
function selectmuestra($mat,$eva){
    $ab="";
    if($mat!='')
        $ab.="
            es.codigo_sis as CodigoSis, CONCAT(us.nombre,us.apellido_paterno) as Estudiante, pro.nombre as Nombre_Proyecto";
    if($eva!='')
        $ab.="
            , eva.promedio as Promedio";
    return $ab;
}
function wheremuestra($mat,$sem,$eva){
    $ac="";
    if($mat!='')
    $ac.="
        AND di.id=".$mat."";
    if($sem!='')
    $ac.="
        AND ins.semestre_id=".$sem."";
    return $ac;
}
function consulta($mat,$sem,$eva){
    $sql="SELECT ".selectmuestra($mat,$eva)."
 FROM estudiante es, usuario us, materia ma, inscrito ins, dicta di, proyecto pro, proyecto_estudiante proes, evaluacion eva
 WHERE es.usuario_id=us.id
 AND eva.id=ins.evaluacion_id
 AND proes.estudiante_id=es.id
 AND proes.proyecto_id=pro.id
 AND ins.estudiante_id=es.id
 AND ins.dicta_id=di.id
 AND di.materia_id=ma.id
".wheremuestra($mat,$sem,$eva)."";
    return $sql;
}
if ($materia!=''&&$semestre!='') {
    MysqlFunciones::DesplegarTabla(consulta($materia,$semestre,$evaluacion), $var);
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
    public static function DesplegarTabla($a,$b)
     {
        $query =  mysql_query($a);
        echo "<table class='tbl_lista'><thead><tr>";
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    echo "<th>".mysql_field_name($query,$i)."</th>";
                }
                echo "</thead>";
        while ($row=mysql_fetch_assoc($query)) {
            echo "</tr><tr class=".classtabla($b).">";
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    echo "<td>".$row[mysql_field_name($query,$i)]."</td>";
                }
            echo "</tr>";
            $b++;
        }    
        echo "</table>";
    echo "<center> 
    <a href='reportes.sistema.pdf.php?sql=".$a."' ><img src='../images/icons/filepd.png' border='0' alt='pdf' title='Descargar PDF'/>Descargar PDF</a>
    <a href='reportes.sistema.excel.php?sql=".$a."' ><img src='../images/icons/excel.png' border='0' alt='exel' title='Descargar EXEL'/>Descargar EXEL</a>
    </center>";
    }
}
exit;

?>