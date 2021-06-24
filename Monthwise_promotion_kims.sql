SELECT departmentnm, sectionnm, lineno, cardno, empname, 
       joining_date, designation, salary_grade, grosssalary  grosssalary ,
	   enmname_bangla, designation_bangla, dept_bangla, sec_bangla,workertype
FROM TB_PERSONAL_INFO
WHERE company                               = :p_company
AND   grosssalary                    > 0
AND   TO_CHAR(joining_date,'RRRR')         = :p_year - 1
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
AND   departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   workertype LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND   cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY departmentnm, sectionnm, lineno,cardno ASC



FUNCTION CF_Basic_SalFormula RETURN NUMBER IS

  v_amount NUMBER;
  
BEGIN
  
  v_amount := Basic_Salary(:GROSSSALARY,:WORKERTYPE);
  
  RETURN v_amount;

EXCEPTION
	WHEN OTHERS THEN v_amount := 0;
END;



FUNCTION CF_DurationFormula RETURN CHAR IS

v_endate  DATE;
v_day     VARCHAR2(10);

BEGIN
  
    BEGIN
    SELECT LAST_DAY(TO_DATE('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr')) INTO v_endate
    FROM   dual;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
    END;  
    
    v_day  :=  FLOOR((v_endate - :JOINING_DATE)/365)||' Yr';
      
    ----v_day  := to_date(v_endate,'dd/mm/rrrr') - to_date(:JOINING_DATE,'dd/mm/rrrr') + 1;
    
    ----v_day  := round((v_day /365) * 12,2);
    
    RETURN v_day;

EXCEPTION
	WHEN OTHERS THEN v_day := '';    
END;




FUNCTION CF_Duration_MnFormula RETURN CHAR IS

v_endate  DATE;
v_day     VARCHAR2(10);

BEGIN
  
    BEGIN
    SELECT LAST_DAY(TO_DATE('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr')) INTO v_endate
    FROM   dual;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
    END;  

    v_day  := FLOOR(((((v_endate - :JOINING_DATE)/365) - FLOOR((v_endate - :JOINING_DATE)/365))*365)/30)||' Mn';
    
    -----v_day  := floor((v_endate - :JOINING_DATE)/365)||'Yr';
      
    ----v_day  := to_date(v_endate,'dd/mm/rrrr') - to_date(:JOINING_DATE,'dd/mm/rrrr') + 1;
    
    ----v_day  := round((v_day /365) * 12,2);
    
    RETURN v_day;

EXCEPTION
	WHEN OTHERS THEN v_day := '';    
END;



FUNCTION CF_LastDateFormula RETURN DATE IS

v_endate  DATE;


BEGIN
  
    BEGIN
    SELECT LAST_DAY(TO_DATE('1-'||:p_month||'-'||:p_year,'dd/mm/rrrr')) INTO v_endate
    FROM   dual;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
    END;  

    
    RETURN v_endate;

EXCEPTION
	WHEN OTHERS THEN v_endate := '';    
END;


FUNCTION CF_Increment_percentFormula RETURN NUMBER IS

v_yr_percent NUMBER;

BEGIN
  
  
   BEGIN
   SELECT figure INTO v_yr_percent
   FROM   TB_SETUP_INFO
   WHERE  ITEM_NAME    = 'YRINCREMENT'
   AND    emp_category = 'All';
   EXCEPTION
   	WHEN NO_DATA_FOUND THEN v_yr_percent := 0;
   	       WHEN OTHERS THEN v_yr_percent := 0;
   END;	
   
   RETURN v_yr_percent;
   
EXCEPTION
	WHEN OTHERS THEN v_yr_percent := 0;   
end;