SELECT info.departmentnm, info.sectionnm, info.lineno, info.cardno, info.empname, info.joining_date, info.designation, 
              info.grosssalary, info.birth_date, info.salary_grade
FROM  TB_PERSONAL_INFO info
WHERE info.company = :p_company
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
AND   info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY info.departmentnm, info.sectionnm, info.lineno, info.cardno ASC


----------------------------------------------------------------------------


SELECT info.departmentnm, info.sectionnm, info.lineno, info.cardno, info.empname, info.joining_date, info.designation, 
              info.grosssalary, info.birth_date, info.salary_grade
FROM  TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company
AND   info.company      = mul.company
AND   mul.user_name   = :p_user
AND   info.cardno         = mul.cardno
ORDER BY info.departmentnm, info.sectionnm, info.lineno, info.cardno ASC