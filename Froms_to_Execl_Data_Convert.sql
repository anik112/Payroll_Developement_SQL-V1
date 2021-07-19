PROCEDURE pr_Forms_to_Excel(p_block_name IN VARCHAR2 DEFAULT NAME_IN(‘SYSTEM.current_block’),
		  					p_path VARCHAR(255) DEFAULT 'D:\',
							p_file_name VARCHAR(255) DEFAULT 'temp') IS

--DECLARE THE OLE objects
application OLE2.OBJ_TYPE;
workbooks OLE2.OBJ_TYPE;
workbook OLE2.OBJ_TYPE;
worksheets OLE2.OBJ_TYPE;
worksheet OLE2.OBJ_TYPE;
cell OLE2.OBJ_TYPE;
RANGE OLE2.OBJ_TYPE;
range_col OLE2.OBJ_TYPE;

--DECLARE handles TO OLE argument LISTS
args OLE2.LIST_TYPE;

--DECLARE FORM AND BLOCK items
form_name VARCHAR2(100);
f_block VARCHAR2(100);
l_block VARCHAR2(100);
f_item VARCHAR2(100);
l_item VARCHAR2(100);
cur_block VARCHAR2(100) := NAME_IN(‘SYSTEM.current_block’);
cur_item VARCHAR2(100) := NAME_IN(‘SYSTEM.current_item’);
cur_record VARCHAR2(100) := NAME_IN(‘SYSTEM.cursor_record’);
item_name VARCHAR2(100);
baslik VARCHAR2(100);
row_n NUMBER;
col_n NUMBER;
filename VARCHAR2(100);

BEGIN
--START Excel
application:=OLE2.CREATE_OBJ(‘Excel.Application’);
OLE2.SET_PROPERTY(application, ‘Visible’, ‘TRUE’);

--RETURN OBJECT handle TO THE Workbooks collection
workbooks:=OLE2.GET_OBJ_PROPERTY(application, ‘Workbooks’);

--ADD a NEW Workbook OBJECT TO THE Workbooks collection
workbook:=OLE2.GET_OBJ_PROPERTY(workbooks,’ADD’);

--RETURN OBJECT handle TO THE Worksheets collection FOR THE Workbook
worksheets:=OLE2.GET_OBJ_PROPERTY(workbook, ‘Worksheets’);

--Get THE FIRST Worksheet IN THE Worksheets collection
--worksheet:=OLE2.GET_OBJ_PROPERTY(worksheets,’ADD’);
args:=OLE2.CREATE_ARGLIST;
OLE2.ADD_ARG(args, 1);
worksheet:=OLE2.GET_OBJ_PROPERTY(worksheets,’Item’,args);
OLE2.DESTROY_ARGLIST(args);

--RETURN OBJECT handle TO cell A1 ON THE NEW Worksheet
go_block(p_block_name);
baslik := get_block_property(p_block_name,FIRST_ITEM);
f_item := p_block_name||’.’||get_block_property(p_block_name,FIRST_ITEM);
l_item := p_block_name||’.’||get_block_property(p_block_name,LAST_ITEM);
first_record;
LOOP
item_name := f_item;
row_n := NAME_IN(‘SYSTEM.CURSOR_RECORD’);
col_n := 1;
LOOP
IF get_item_property(item_name,ITEM_TYPE)<>’BUTTON’ AND
get_item_property(item_name,VISIBLE)=’TRUE’
THEN
--SET FIRST ROW WITH THE item names
IF row_n=1 THEN
baslik:=NVL(get_item_property(item_name,PROMPT_TEXT),baslik);
args:=OLE2.CREATE_ARGLIST;
OLE2.ADD_ARG(args, row_n);
OLE2.ADD_ARG(args, col_n);
cell:=OLE2.GET_OBJ_PROPERTY(worksheet, ‘Cells’, args);
OLE2.DESTROY_ARGLIST(args);
OLE2.SET_PROPERTY(cell, ‘VALUE’, baslik);
OLE2.RELEASE_OBJ(cell);
END IF;
--SET other ROWS WITH THE item VALUES
args:=OLE2.CREATE_ARGLIST;
OLE2.ADD_ARG(args, row_n+1);
OLE2.ADD_ARG(args, col_n);
cell:=OLE2.GET_OBJ_PROPERTY(worksheet, ‘Cells’, args);
OLE2.DESTROY_ARGLIST(args);
IF get_item_property(item_name,DATATYPE)<>’NUMBER’ THEN
OLE2.SET_PROPERTY(cell, ‘NumberFormat’, ‘@’);
END IF;
OLE2.SET_PROPERTY(cell, ‘VALUE’, name_in(item_name));
OLE2.RELEASE_OBJ(cell);
END IF;
IF item_name = l_item THEN
EXIT;
END IF;
baslik := get_item_property(item_name,NEXTITEM);
item_name := p_block_name||’.’||get_item_property(item_name,NEXTITEM);
col_n := col_n + 1;
END LOOP;
EXIT WHEN NAME_IN(‘SYSTEM.last_record’) = ‘TRUE’;
NEXT_RECORD;
END LOOP;

--Autofit COLUMNS
RANGE := OLE2.GET_OBJ_PROPERTY( worksheet,’UsedRange’);
range_col := OLE2.GET_OBJ_PROPERTY( RANGE,’COLUMNS’);
OLE2.INVOKE( range_col,’AutoFit’ );
OLE2.RELEASE_OBJ( RANGE );
OLE2.RELEASE_OBJ( range_col );
/*
— Get filename and path
args := OLE2.CREATE_ARGLIST;
OLE2.ADD_ARG( args, p_block_name );
OLE2.ADD_ARG( args,’Excel Workbooks (*.xls, *.xls’);
filename := OLE2.INVOKE_CHAR( application,’GetSaveAsFilename’,args );
OLE2.DESTROY_ARGLIST( args );
*/

---Save AS worksheet
IF NVL(filename,’0')<>’0' THEN
args := OLE2.CREATE_ARGLIST;
OLE2.ADD_ARG( args,filename );
OLE2.INVOKE( worksheet,’SaveAs’,args );
OLE2.DESTROY_ARGLIST( args );
END IF;

--CLOSE workbook
--OLE2.INVOKE( workbook ,’CLOSE’);

--Release THE OLE objects
OLE2.RELEASE_OBJ(worksheet);
OLE2.RELEASE_OBJ(worksheets);
OLE2.RELEASE_OBJ(workbook);
OLE2.RELEASE_OBJ(workbooks);
--OLE2.INVOKE(application, ‘Quit’);
OLE2.RELEASE_OBJ(application);

--Focus TO THE original LOCATION
go_block(cur_block);
go_record(cur_record);
go_item(cur_block||’.’||cur_item);
END;