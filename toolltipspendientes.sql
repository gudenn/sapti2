UPDATE tooltip SET descripcion = 
CONCAT(UCASE(LEFT(descripcion, 1)), 
                             SUBSTRING(descripcion, 2))
WHERE `estado_tooltip` ='RC';

UPDATE tooltip SET descripcion = 
REPLACe(descripcion,'_',' ')
WHERE `estado_tooltip` ='RC';

UPDATE tooltip SET titulo = 
CONCAT(UCASE(LEFT(titulo, 1)), 
                             SUBSTRING(titulo, 2))
WHERE `estado_tooltip` ='RC';



UPDATE tooltip SET titulo = 
REPLACe(titulo,'_',' ')
WHERE `estado_tooltip` ='RC';

UPDATE tooltip SET estado_tooltip = 'AP'
WHERE `estado_tooltip` ='RC';


-- Ortografia 

UPDATE tooltip SET titulo = 
REPLACe(titulo,'titulo','t&iacute;tulo')
WHERE titulo LIKE '%titulo%';
UPDATE tooltip SET titulo = 
REPLACe(titulo,'Titulo','T&iacute;tulo')
WHERE titulo LIKE '%titulo%';

-- Configuracion De Ayudas
SET @directorio = '/sapti_test/';
UPDATE helpdesk SET directorio = REPLACE(directorio,'/sapti/',@directorio) WHERE 1;
