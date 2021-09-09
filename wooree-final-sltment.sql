SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date) ,12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND  joining_date IS NOT NULL
AND  resignation_date IS NOT NULL
AND   grosssalary > 0 
AND   TO_CHAR(resignation_date,'RRRR')  LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   departmentnm    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   designation LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   workertype LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   floorno       LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    shift LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   shift LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
ORDER BY departmentnm,sectionnm,lineno,cardno ASC




DECLARE

  v_ot_rate NUMBER(10,2) := 0.0;
  
BEGIN
  
  v_ot_rate := Ot_Rate('Woo Ree Apparels Ltd.',15000,'Worker', 'Y');
  
   DBMS_OUTPUT.PUT_LINE(v_ot_rate);

EXCEPTION
	WHEN OTHERS THEN v_ot_rate := 0.0;
END;



----------------------


SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   departmentnm  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION
SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   sectionnm  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION 
SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   workertype  IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION 
SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   lineno  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION 
SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   floorno  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION 
SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   machineno  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION 
SELECT  cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,workertype, resignation_date, 
           (resignation_date+1)payment_date, present_address, permanentaddress,
           RTRIM(TO_CHAR(resignation_date,'Month'))month_reg, TO_CHAR(resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(resignation_date,joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(resignation_date,joining_date),12))mn,
           TRUNC(resignation_date - ADD_MONTHS( joining_date, MONTHS_BETWEEN(resignation_date,joining_date)))dd,
           present_add_ban, permanent_add_ban, enmname_bangla, designation_bangla, dept_bangla, sec_bangla, otorg
FROM TB_PERSONAL_INFO
WHERE company   =:p_company
AND   joining_date IS NOT NULL
AND   resignation_date IS NOT NULL
AND   grosssalary  > 0 
AND   TO_CHAR(resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   shift  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user) 
AND   gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
UNION 
SELECT  info.cardno,info.secreteno,info.empname,info.joining_date,info.designation,info.grosssalary,info.lineno,info.sectionnm,info.departmentnm,
           info.workertype,info.resignation_date,(info.resignation_date+1)payment_date, info.present_address,info.permanentaddress,
           RTRIM(TO_CHAR(info.resignation_date,'Month'))month_reg, TO_CHAR(info.resignation_date,'RRRR')year_reg,
           TRUNC(MONTHS_BETWEEN(info.resignation_date, info.joining_date)/12)yr ,
           TRUNC(MOD( MONTHS_BETWEEN(info.resignation_date,info.joining_date),12))mn,
           TRUNC(info.resignation_date - ADD_MONTHS(info.joining_date, MONTHS_BETWEEN(info.resignation_date,info.joining_date)))dd,
           info.present_add_ban, info.permanent_add_ban, info.enmname_bangla, info.designation_bangla, info.dept_bangla, info.sec_bangla, info.otorg
FROM TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE info.company   =:p_company
AND   info.company = mul.company
AND   info.joining_date IS NOT NULL
AND   info.resignation_date IS NOT NULL
AND   info.grosssalary  > 0 
AND   mul.user_name = :p_user
AND   info.cardno = mul.cardno
AND   TO_CHAR(info.resignation_date,'RRRR')               LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.resignation_date,'Month'))  LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)