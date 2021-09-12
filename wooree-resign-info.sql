SELECT sectionnm, cardno, empname, joining_date, designation, birth_date,grosssalary, departmentnm, lineno,secreteno
FROM   TB_PERSONAL_INFO 
WHERE company                   =:p_company 
AND    RTRIM(TO_CHAR(joining_date,'rrrr')) = :p_year
AND   RTRIM(TO_CHAR(joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    sectionnm LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    lineno LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    shift LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    cardno       LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY sectionnm,lineno,cardno ASC