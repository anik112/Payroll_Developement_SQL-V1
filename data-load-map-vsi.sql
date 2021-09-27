--  get data from data load table and store in master data table 
DECLARE 

v_showalert NUMBER := 0;

v_company     VARCHAR2(255):= 'Woo Ree Apparels Ltd.';
v_worker_type VARCHAR2(85) := 'Worker';
v_shift       VARCHAR2(10) := 'G';

v_cardno    VARCHAR2(150);
v_emp_name  VARCHAR2(150);
v_dept_name VARCHAR2(150);
v_sec_name  VARCHAR2(150);

v_lineno    VARCHAR2(150);
v_secreteno VARCHAR2(85);
v_load_intime VARCHAR2(85);
v_load_outtime VARCHAR2(85);
v_load_date   VARCHAR2(85);

v_strt_intime VARCHAR2(85);
v_last_intime VARCHAR2(85);
v_late_time   VARCHAR2(85);
v_late_status VARCHAR2(85):='';
v_exit_time   VARCHAR2(85);
v_early_in    NUMBER;
v_early_status VARCHAR2(85):='Early';
v_late_in     NUMBER;

v_ot          NUMBER;
v_ot_part     NUMBER;
v_duration    VARCHAR2(85) := '0:00';

BEGIN

------ get in time and out time 
FOR cls IN ( 
SELECT  info.company, info.cardno, info.empname, info.departmentnm, info.sectionnm, info.lineno, info.shift, info.workertype,
        load.secreteno, load.datadate, MIN(load.datatime) intime , MAX(load.datatime) outtime
FROM TB_DATA_LOAD load, TB_PERSONAL_INFO info
WHERE load.secreteno = info.secreteno
GROUP BY info.company, load.secreteno, info.cardno, load.datadate, info.empname, info.departmentnm, 
         info.sectionnm, info.lineno, info.shift, info.workertype
ORDER BY info.cardno ASC
) LOOP 

v_cardno      := cls.cardno;
v_secreteno   := cls.secreteno;
v_emp_name    := cls.empname;
v_dept_name   := cls.departmentnm;
v_sec_name    := cls.sectionnm;
v_lineno      := cls.lineno;
v_worker_type := cls.workertype;
v_shift       := cls.shift;
v_load_date   := cls.datadate;
v_load_intime := cls.intime;
v_load_outtime:= cls.outtime;



-- get duty schedule ------
BEGIN
SELECT 
TO_CHAR(instarttime,'hh24miss'), 
TO_CHAR(latestarttime,'hh24miss'), 
TO_CHAR(lastintime,'hh24miss'), 
TO_CHAR(exittime,'hh24miss')
INTO   
v_strt_intime, 
v_late_time , 
v_last_intime, 
v_exit_time
FROM TB_DUTY_SCHEDULE_SETUP
WHERE company        = LTRIM(RTRIM(v_company))
AND   section_worker = LTRIM(RTRIM(v_worker_type))
AND   shift          = v_shift;
EXCEPTION
WHEN NO_DATA_FOUND  THEN 
	v_showalert := 0;
WHEN TOO_MANY_ROWS THEN
   v_showalert := 0;
END;


--- get information For G,A,B shift ---

IF (v_load_intime BETWEEN '051001' AND '235959') THEN

	-- get late & early information 
	IF (TO_DATE(v_load_intime,'hh24:mi:ss') > TO_DATE(v_late_time,'hh24:mi:ss')) AND (v_late_time IS NOT NULL) THEN
	   v_late_in    := FLOOR(((TO_DATE(v_load_intime,'hh24:mi:ss')-TO_DATE(v_late_time,'hh24:mi:ss'))*24)*60);
	   v_late_status:='Late';
	   v_early_in   := 0;
	ELSIF TO_DATE(v_load_intime,'hh24:mi:ss') < TO_DATE(v_late_time,'hh24:mi:ss') AND (v_late_time IS NOT NULL) THEN
	   v_early_in := FLOOR(((TO_DATE(v_late_time,'hh24:mi:ss')-TO_DATE(v_load_intime,'hh24:mi:ss'))*24)*60);
	   v_early_status := 'Early';
	   v_late_in  := 0;
	ELSE
	   v_late_status:='';
	   v_early_in   := 0;
	   v_early_status := '';
	   v_late_in      := 0;
	END IF;
	
	
	-- get OT for G,A,B shift --
	IF (TO_DATE(v_load_outtime,'hh24:mi:ss') > TO_DATE(v_exit_time,'hh24:mi:ss')) AND (v_exit_time IS NOT NULL) THEN
	   
	   v_ot := FLOOR(((TO_DATE(v_load_outtime,'hh24:mi:ss')-TO_DATE(v_exit_time,'hh24:mi:ss'))*24)*60);
	   
	   --- compiance OT 
	   IF v_ot > 120 THEN
	      v_ot_part := (v_ot-120);
	   ELSE
		  v_ot_part := v_ot;
	   END IF;
	   
	ELSE
	   v_ot      := 0;
	   v_ot_part := 0;
	END IF;
	
	
	
	
	
	
END IF;


DBMS_OUTPUT.PUT_LINE(
v_cardno||' > '||
v_emp_name||' > '||
v_worker_type||' > '||
v_load_intime||' - '||
v_load_outtime||' > '||
v_late_time||' > '||
'Late: '|| v_late_in||' > '||
'Early: '||v_early_in||' > '||
'OT: '||v_ot||' > '||
'COMP OT: '||v_ot_part
);

END LOOP;
END;
