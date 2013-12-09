<?php
    define ("MODULO", "DOCENTE");
   require('../_start.php');
   leerClase('Usuario');
   leerClase('Dicta');
   leerClase('Evaluacion');
	if(isset($_GET['sql']))
        $consulta = $_GET['sql'];
        $iddicta  = $_GET['iddicta'];
          function array_recibe($url_array) { 
                    $tmp = stripslashes($url_array); 
                    $tmp = urldecode($tmp); 
                    $tmp = unserialize($tmp); 

            return $tmp; 
        };
        $consulta=  array_recibe($consulta); 
if($_GET['eva']==1){
     $resul = "
      SELECT ev.id as id
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe, evaluacion ev
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
AND pe.proyecto_id=pr.id
AND it.evaluacion_id=ev.id
AND di.id='".$iddicta."' 
          ";
   $sql1 = mysql_query($resul);
   if(mysql_num_rows($sql1)>0){
while ($fila1 = mysql_fetch_array($sql1, MYSQL_ASSOC)) {
   $idevaluacion[]=$fila1;
 }
     foreach ($idevaluacion as $idevaluacion_array) {
     $evaluacion = new Evaluacion($idevaluacion_array['id']);
     $evaluacion->setPromedio();     
   }
 };
 };
	$resultado =mysql_query($consulta); 
	
		date_default_timezone_set('America/La_Paz');

		if (PHP_SAPI == 'cli')
			die('Este archivo solo se puede ver desde un navegador web');

		/** Se agrega la libreria PHPExcel */
		require_once DIR_LIB.'/PHPExcel/PHPExcel.php';

		// Se crea el objeto PHPExcel
		$objPHPExcel = new PHPExcel();
                
		// Se asignan las propiedades del libro
		$objPHPExcel->getProperties()->setCreator("Codedrinks") //Autor
							 ->setLastModifiedBy("Sapti") //Ultimo usuario que lo modificó
							 ->setTitle("Reporte Excel")
							 ->setSubject("Reporte Excel")
							 ->setDescription("Reporte de Proceso")
							 ->setKeywords("reporte Proceso")
							 ->setCategory("Reporte excel");
                $alfa='A';

                for($i=0;$i<mysql_num_fields($resultado);$i++)
                {     
                    $titulosColumnas[]=mysql_field_name($resultado,$i);
                    $alfabeto[]=++$alfa;
                }
		
		$objPHPExcel->setActiveSheetIndex(0)
        		    ->mergeCells('A1:'.$alfa.'1');
						
		// Se agregan los titulos del reporte
                $orden=3;
                for($i=0;$i<mysql_num_fields($resultado);$i++)
                {
                    $objPHPExcel->setActiveSheetIndex(0)
                                ->setCellValue($alfabeto[$i].$orden,  $titulosColumnas[$i]);
                }        
 		
		//Se agregan los datos de los alumnos
		$ir = 4;
		while ($fila =mysql_fetch_array($resultado, MYSQL_ASSOC)) {
                       for($i=0;$i<mysql_num_fields($resultado);$i++)
                       {
                           $objPHPExcel->setActiveSheetIndex(0)
                                       ->setCellValue($alfabeto[$i].$ir, $fila[$titulosColumnas[$i]]);
                       }; 
		$ir++;
		};
		
		$estiloTituloReporte = array(
        	'font' => array(
                                'name'      => 'Verdana',
                                'bold'      => true,
                                'italic'    => false,
                                'strike'    => false,
                                'size'      => 9,
                                'color'     => array(
                                                    'rgb' => '000000'
                                                )
                                ),
	        'fill' => array(
				'type'	=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'	=> array('argb' => 'c5c5c5')
                                ),
                'borders' => array(
               	'allborders' => array(
                	'style' => PHPExcel_Style_Border::BORDER_NONE                    
               	)
            ), 
            'alignment' =>  array(
        			'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        			'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
        			'rotation'   => 0,
        			'wrap'          => TRUE
    		)
        );

		$estiloTituloColumnas = array(
            'font' => array(
                'name'      => 'Arial',
                'bold'      => true,                          
                'color'     => array(
                                    'rgb' => '000000'
                                    )
                        ),
                'fill' 	=> array(
				'type'		=> PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,
				'rotation'      => 90,
                                'startcolor'    => array(
                                                        'rgb' => 'b5b5b5'
                                                        ),
                                'endcolor'      => array(
                                                        'argb'          => 'c5c5c5'
                                                        )
                            ),
            'borders' => array(
                        	'top'       => array(
                                'style'     => PHPExcel_Style_Border::BORDER_MEDIUM ,
                                'color'     => array(
                                                    'rgb' => '000000'
                                                    )
                                                    ),
                    'bottom'     => array(
                    'style'     => PHPExcel_Style_Border::BORDER_MEDIUM ,
                    'color'     => array(
                                    'rgb' => '000000'
                                    )
                                    )
                    ),
			'alignment' =>  array(
        			'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        			'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
        			'wrap'          => TRUE
    		));
			
		$estiloInformacion = new PHPExcel_Style();
		$estiloInformacion->applyFromArray(
			array(
           		'font' => array(
               	'name'      => 'Arial',               
               	'color'     => array(
                   	'rgb' => '000000'
               	)
           	),
           	'fill' 	=> array(
				'type'		=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'		=> array('argb' => 'FFFFFF')
			),
           	'borders' => array(
               	'left'     => array(
                   	'style' => PHPExcel_Style_Border::BORDER_THIN ,
	                'color' => array(
    	            	'rgb' => '000000'
                   	)
               	)             
           	)
        ));
                $dicta=new Dicta($iddicta);
                $usuario=  getSessionUser();
		$tituloReporte = "Reporte Sistema SAPTI  Usuario: ".$usuario->getNombreCompleto()."  Materia: ".$dicta->getNombreMateria()."  Fecha:".date("d/m/Y")." Hora:".date("H:i:s");
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('A1',$tituloReporte); 
		$objPHPExcel->getActiveSheet()->getStyle('A1:'.$alfa.'1')->applyFromArray($estiloTituloReporte);
		$objPHPExcel->getActiveSheet()->getStyle('A3:'.$alfa.'3')->applyFromArray($estiloTituloColumnas);		
		//$objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion, "A4:".$alfa.($ir-1));
				
		for($i = 'A'; $i <= $alfa; $i++){
			$objPHPExcel->setActiveSheetIndex(0)			
				->getColumnDimension($i)->setAutoSize(TRUE);
		}
		
		// Se asigna el nombre a la hoja
		$objPHPExcel->getActiveSheet()->setTitle('Alumnos');

		// Se activa la hoja para que sea la que se muestre cuando el archivo se abre
		$objPHPExcel->setActiveSheetIndex(0);
		// Inmovilizar paneles 
		//$objPHPExcel->getActiveSheet(0)->freezePane('A4');
		$objPHPExcel->getActiveSheet(0)->freezePaneByColumnAndRow(0,4);

		// Se manda el archivo al navegador web, con el nombre que se indica (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="ReporteProceso.xlsx"');
		header('Cache-Control: max-age=0');

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter->save('php://output');
		exit;
		
	
?>