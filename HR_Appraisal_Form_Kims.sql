SELECT info.lineno, info.sectionnm, info.sec_bangla, info.departmentnm, info.dept_bangla,info.cardno,info.enmname_bangla, info.designation_bangla, info.joining_date,
               info.birth_date, info.present_add_ban,info.permanent_add_ban,info.grosssalary, info.salary_grade, info.workertype
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company = :p_company
AND   info.company = other.company
AND   info.company = promo.company
AND   info.cardno  = other.cardno
AND   TO_CHAR(info.joining_date,'RRRR')              LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.departmentnm LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation     LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.cardno            LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   info.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY info.departmentnm, info.sectionnm, info.lineno, info.cardno ASC

--9331

SELECT * FROM
(SELECT * FROM TB_PROMOTION_INFO
WHERE cardno='9331'
ORDER BY effectivedate DESC)
WHERE ROWNUM=1



SELECT MAX(effectivedate) FROM TB_PROMOTION_INFO
WHERE company = :p_company
AND   cardno='9331'

SELECT prosalary FROM TB_PROMOTION_INFO
WHERE company = :p_company
AND   effectivedate
AND   cardno='9331'



FUNCTION cf_basic_salaryformula RETURN NUMBER IS
    
  v_basic NUMBER := 0;
  
BEGIN
  
  v_basic := basic_salary(:grosssalary,:workertype);
  
  RETURN v_basic;

EXCEPTION
	WHEN OTHERS THEN NULL;
END;


FUNCTION cf_convance_billformula RETURN NUMBER IS

  v_convance NUMBER := 0;
  
BEGIN
  
  v_convance := convance_salary(:grosssalary,:workertype);
  
  RETURN v_convance;

EXCEPTION
	WHEN OTHERS THEN NULL;
END;


FUNCTION cf_food_allowformula RETURN NUMBER IS
  
  v_food_allow NUMBER := 0;
  
BEGIN
  
  v_food_allow := food_salary(:grosssalary,:workertype);
  
  RETURN v_food_allow;

EXCEPTION
	WHEN OTHERS THEN NULL;
END;




FUNCTION cf_medicalformula RETURN NUMBER IS
  
  v_medical NUMBER := 0;
  
BEGIN
  
  v_medical := medical_salary(:grosssalary,:workertype);
  
  RETURN v_medical;

EXCEPTION
	WHEN OTHERS THEN NULL;
END;



FUNCTION cf_house_rtformula RETURN NUMBER IS
 
  v_house NUMBER := 0;
  
BEGIN
  
  v_house := house_salary(:grosssalary,:workertype);
  
  RETURN v_house;

EXCEPTION
	WHEN OTHERS THEN NULL;
END;