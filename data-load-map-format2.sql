--  get data from data load table and store in master data table 
declare 

v_showalert number := 0;

v_company     varchar2(255):= 'Data DSS';
v_worker_type varchar2(85) := 'Worker';
v_shift       varchar2(10) := 'G';

v_cardno    varchar2(150);
v_emp_name  varchar2(150);
v_dept_name varchar2(150);
v_sec_name  varchar2(150);

v_lineno    varchar2(150);
v_secreteno varchar2(85);
v_load_intime varchar2(85);
v_load_outtime varchar2(85);
v_load_date   varchar2(85);

v_strt_intime varchar2(85);
v_last_intime varchar2(85);
v_late_time   varchar2(85);
v_late_status varchar2(85):='';
v_exit_time   varchar2(85);
v_early_in    number;
v_early_status varchar2(85):='Early';
v_late_in     number;

v_ot          number;
v_ot_part     number;
v_duration    varchar2(85) := '0:00';

begin

------ get in time and out time 
for cls in ( 
select  info.company, info.cardno, info.empname, info.departmentnm, info.sectionnm, info.lineno, info.shift, info.workertype,
        load.secreteno, load.datadate, min(load.datatime) intime , max(load.datatime) outtime
from tb_ddss_data_load load, tb_ddss_personal_info info
where load.secreteno = info.secreteno
group by info.company, load.secreteno, info.cardno, load.datadate, info.empname, info.departmentnm, 
         info.sectionnm, info.lineno, info.shift, info.workertype
order by info.cardno asc
) loop 

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
begin
select 
to_char(instarttime,'hh24:mi:ss'), 
to_char(latestarttime,'hh24:mi:ss'), 
to_char(lastintime,'hh24:mi:ss'), 
to_char(exittime,'hh24:mi:ss')
into   
v_strt_intime, 
v_late_time , 
v_last_intime, 
v_exit_time
from tb_ddss_duty_schedule_setup
where company        = ltrim(rtrim(v_company))
and   section_worker = ltrim(rtrim(v_worker_type))
and   shift          = v_shift;
exception
when no_data_found  then 
	v_showalert := 0;
when too_many_rows then
   v_showalert := 0;
end;


--- get information For G,A,B shift ---

if (v_load_intime between '051001' and '235959') then

	-- get late & early information 
	if v_load_intime > v_late_time then
	   v_late_in    := floor(((to_date(v_load_intime,'hh24:mi:ss')-to_date(v_late_time,'hh24:mi:ss'))*24)*60);
	   v_late_status:='Late';
	   v_early_in   := 0;
	elsif v_load_intime < v_late_time then
	   v_early_in := floor(((to_date(v_late_time,'hh24:mi:ss')-to_date(v_load_intime,'hh24:mi:ss'))*24)*60);
	   v_early_status := 'Early';
	   v_late_in  := 0;
	else
	   v_late_status:='';
	   v_early_in   := 0;
	   v_early_status := '';
	   v_late_in  := 0;
	end if;
	
	
	-- get OT for G,A,B shift --
	if v_load_outtime > v_exit_time then
	   
	   v_ot := floor(((to_date(v_load_outtime,'hh24:mi:ss')-to_date(v_exit_time,'hh24:mi:ss'))*24)*60);
	   
	   --- compiance OT 
	   if v_ot > 120 then
	      v_ot_part := (v_ot-120);
	   else
		  v_ot_part := v_ot;
	   end if;
	   
	else
	   v_ot      := 0;
	   v_ot_part := 0;
	end if;
	
end if;


dbms_output.put_line(
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

end loop;
end;
