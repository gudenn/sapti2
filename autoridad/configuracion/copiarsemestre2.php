<?php
  require('../_start.php');

$semestre=$_POST['semestre'];

$var=0;
function consulta($sem){
    $sql="SELECT ma.nombre as Materia, cg.nombre as Grupo,CONCAT(us.apellido_paterno,' ',us.apellido_materno,' ',us.nombre) as Docente, se.codigo as Semestre
FROM dicta di, semestre se, docente dc, materia ma, usuario us, codigo_grupo cg
WHERE di.semestre_id=se.id
AND di.materia_id=ma.id
AND dc.usuario_id=us.id
AND di.docente_id=dc.id
AND di.codigo_grupo_id=cg.id
AND se.id=".$sem."";
    return $sql;
}
function consultaconf($sem){
    $sql="SELECT cs.nombre as Variable, cs.valor as Valor, se.codigo as Semestre
FROM configuracion_semestral cs, semestre se
WHERE cs.semestre_id=se.id
AND se.id=".$sem."";
    return $sql;
}
if ($semestre!='') {
    MysqlFunciones::DesplegarTabla(consulta($semestre), $var, 'mat');
    MysqlFunciones::DesplegarTabla(consultaconf($semestre), $var, 'conf');
}else{
    echo 'Por Favor Seleccione un Semestre para Mostrar la Configuracion...';
}
function classtabla($va){
    $clas='light';
    if($va%2 == 0){
    $clas='dark';    
    }
    return $clas;
};

class MysqlFunciones{
    public static function DesplegarTabla($a,$b, $t)
     {
        if($t=='mat'){
            echo "<h1 class='title'>Materias del Semestre</h1>";
        }else{
            echo "<h1 class='title'>Configuracion de Semestre</h1>";            
        }
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
    }
}
exit;

?>