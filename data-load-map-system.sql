--  get Data from data load table and store in master data table 
DECLARE 

v_company     VARCHAR2(255):= 'Data DSS';
v_worker_type VARCHAR2(85) := 'Worker';
v_shift       VARCHAR2(10) := 'G';

v_cardno    VARCHAR2(150);
v_emp_name  varchar2(150);
v_dept_name varchar2(150);
v_sec_name  varchar2(150);
v_pdate     date;
v_lineno    varchar2(150);


v_inputINTIME VARCHAR2(85);
v_inputOUTIME VARCHAR2(85);
v_inputDATE   VARCHAR2(85);
v_inputSECRECTNO VARCHAR2(150);
v_intime_strt date;
v_last_intime date;
v_late_time   date;
v_exit_time   date;
v_early_in    number;
v_late_in     number;
v_ot          number;

BEGIN

------ get in time and out time 
FOR cls IN ( 
SELECT  SECRETENO, DATADATE, MAX(DATATIME) outtime, MIN(DATATIME) intime 
FROM TB_DDSS_DATA_LOAD 
GROUP BY SECRETENO, DATADATE
) LOOP 


select cardno, empname, departmentnm, sectionnm, lineno, shift, workertype 
into v_cardno, v_emp_name, v_dept_name, v_sec_name, v_lineno, v_shift, v_worker_type
from tb_ddss_personal_info
where company   = ltrim(rtrim(v_company))
and   secreteno = cls.secreteno;



SELECT instarttime, latestarttime, 
	   lastintime, exittime
INTO   v_intime_strt, v_late_time , v_last_intime, v_exit_time
FROM TB_DDSS_DUTY_SCHEDULE_SETUP
WHERE company        = ltrim(rtrim(v_company))
AND   section_worker = 'Worker'--ltrim(rtrim(v_worker_type))
AND   shift          = v_shift;

DBMS_OUTPUT.PUT_LINE(v_cardno||' > '||v_emp_name||' > '||v_worker_type||' > '||to_date(v_late_time,'hh24:mi:ss')||' > '||v_exit_time);
/*
IF to_date(cls.intime,'hh24miss') > v_late_time THEN
v_late_in  := FLOOR(((to_date(cls.intime,'hh24miss')-v_late_time)*24)*60);
else
v_late_in  := 0;
END IF;

IF to_date(cls.intime,'hh24miss') < v_late_time then
v_early_in := FLOOR(((v_late_time-to_date(cls.intime,'hh24miss'))*24)*60);
else
v_early_in := 0;
end if;

IF to_date(cls.outtime,'hh24miss') > v_exit_time then
v_ot := FLOOR(((to_date(cls.outtime,'hh24miss')-v_exit_time)*24)*60);
else
v_ot := 0;
end if;

DBMS_OUTPUT.PUT_LINE(v_cardno||' > '||v_emp_name||' > '||cls.SECRETENO||' > '||v_shift||' > '||v_worker_type||' > '||cls.DATADATE||' > '||cls.intime||' - '||cls.outtime||' Late: '||v_late_in||' Early Out: '||v_early_in||' Ot min: '||v_ot);

*/
v_intime_strt := null;
v_late_time   := null;
v_last_intime := null;
v_exit_time   := null;
v_early_in    :=0;
v_late_in     :=0;
v_ot          :=0;

END LOOP;
END;




-- get duty schedule setup  
SELECT TO_CHAR(instarttime,'hh24mmss'), TO_CHAR(latestarttime,'hh24mmss'), 
	   TO_CHAR(lastintime,'hh24mmss'),  TO_CHAR(exittime,'hh24mmss')
INTO   v_intime_strt, v_late_time , v_last_intime, v_exit_time
FROM TB_DUTY_SCHEDULE_SETUP
WHERE company        = v_company
AND   section_worker = v_worker_type
AND   shift          = v_shift;






-- Success fully develop code  
--================================================================

-- get data from file and store in database  
DECLARE
--v_inputText VARCHAR2(150) :='001:0000012114:20210922:154001:11';

v_file UTL_FILE.FILE_TYPE;
v_output VARCHAR(150);

BEGIN

v_file := UTL_FILE.FOPEN('DIR_DATALOAD','161120200308.txt','R');

LOOP
BEGIN
UTL_FILE.GET_LINE(v_file,v_output);
DBMS_OUTPUT.PUT_LINE(v_output);

IF LENGTH(RTRIM(LTRIM(v_output))) > 29 THEN

-- INsert data into load table 
INSERT INTO TEST_DATA_LOAD (MACHINENO, SECRETENO, DATADATE, DATATIME, STATUS)
VALUES (SUBSTR(v_output,0,3), SUBSTR(v_output,5,10), SUBSTR(v_output,16,8), SUBSTR(v_output,25,6), SUBSTR(v_output,32,2));

END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT; 
END;

END LOOP;

UTL_FILE.FCLOSE(v_file);
END;



select cardno, empname, departmentnm, sectionnm, lineno, shift, workertype 
from tb_ddss_personal_info


----------------- Test Code  -------------------========================
--====================================================================

CREATE DIRECTORY DIR_DATALOAD AS 'D:\DATA\';
DECLARE
V1 VARCHAR2(200); --32767
F1 UTL_FILE.FILE_TYPE;
BEGIN
F1 := UTL_FILE.FOPEN('DIR_DATALOAD','161120200308.txt','R');
LOOP
BEGIN
UTL_FILE.GET_LINE(F1,V1);
DBMS_OUTPUT.PUT_LINE(V1);
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT; END;
END LOOP;
IF UTL_FILE.IS_OPEN(F1) THEN
DBMS_OUTPUT.PUT_LINE('File is Open');
END IF;
UTL_FILE.FCLOSE(F1);
END; 
------------- test purpouse 
SELECT LENGTH(RTRIM(LTRIM('  asdjhcnif dhfu'))) FROM dual
SELECT  SECRETENO, DATADATE, MAX(DATATIME), MIN(DATATIME) FROM TEST_DATA_LOAD GROUP BY SECRETENO, DATADATE
SELECT instarttime, TO_CHAR(instarttime,'hh24mmss'), latestarttime, TO_CHAR(latestarttime,'hh24mmss'), 
lastintime, TO_CHAR(lastintime,'hh24mmss'), exittime, TO_CHAR(exittime,'hh24mmss')
FROM TB_DUTY_SCHEDULE_SETUP
WHERE company=:p_company
AND   section_worker = :p_worker
AND   shift = :p_shift



SELECT ltrim(rtrim(to_char(exittime,'hh24miss'))), exittime, (to_date('120301','hh24miss')-exittime)*24
FROM TB_DDSS_DUTY_SCHEDULE_SETUP



select ABS(instarttime-to_date('173001','hh24miss'))*24 from TB_DDSS_DUTY_SCHEDULE_SETUP


select ABS(to_date('081523','hh24miss')-to_date('080521','hh24miss'))*24 from dual


select load.DATADATE, to_date(load.datatime,'hh24miss'), setup.latestarttime, round((to_date(load.datatime,'hh24miss')-setup.latestarttime)*24,2)
from tb_ddss_data_load load, TB_DDSS_DUTY_SCHEDULE_SETUP setup
where load.SECRETENO='0020002568'


select load.DATADATE, to_date(load.datatime,'hh24:mi:ss'), setup.latestarttime, 
round(ABS((setup.latestarttime-to_date(load.datatime,'hh24:mi:ss'))*24)*60)
from tb_ddss_data_load load, TB_DDSS_DUTY_SCHEDULE_SETUP setup
where load.SECRETENO='0020002568'




select  info.cardno, info.empname, info.departmentnm, info.sectionnm, info.lineno, info.shift, info.workertype, 
        load.secreteno, load.datadate, min(load.datatime) intime , max(load.datatime) outtime, info.company
from tb_ddss_data_load load, tb_ddss_personal_info info
where load.secreteno = info.secreteno
GROUP BY info.company, load.SECRETENO, info.cardno, load.DATADATE, info.empname, info.departmentnm, 
info.sectionnm, info.lineno, info.shift, info.workertype
order by info.cardno asc



select 
into v_cardno, v_emp_name, v_dept_name, v_sec_name, v_lineno, v_shift, v_worker_type
from tb_ddss_personal_info
where company   = ltrim(rtrim(v_company))
and   secreteno = cls.secreteno;
