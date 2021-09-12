SELECT a.loanamount,a.dedamount,a.balamount,a.loanmonth,a.dedmonth,
               a.dedyear, a.cardno,b.empname,b.designation,a.loanyear, b.departmentnm, b.sectionnm, b.lineno,a.loan_type
FROM  TB_ADVANCEORLOAN_INFO a,TB_PERSONAL_INFO b
WHERE  b.company = :p_company
AND   b.company      = a.company
AND   a.loanyear       = :p_year
AND   a.loanmonth    = :p_month
AND   a. loan_type    = :p_type
AND   a.dedamount IS NOT NULL
AND   a.cardno              = b.cardno
AND   b.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   b.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   b.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   b.workertype        LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   b.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   b.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   b.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   b.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   a.cardno             LIKE DECODE(NVL(:emp,'all'),'all','%',:emp)
AND   b.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY a.slno,a.cardno ASC

------

SELECT a.loanamount,a.dedamount,a.balamount,a.loanmonth,a.dedmonth,
              a.dedyear,a.cardno,b.empname,b.designation,a.loanyear, b.departmentnm, b.sectionnm, b.lineno,a.loan_type
FROM  TB_ADVANCEORLOAN_INFO a,TB_PERSONAL_INFO b
WHERE  b.company  = :p_company
AND   b.company       = a.company
AND   a.loan_type      = :p_type
AND   a.dedamount IS NOT NULL
AND   a.cardno           = b.cardno
AND   b.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   b.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   b.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   b.workertype        LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   b.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   b.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   b.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   b.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   a.cardno             LIKE DECODE(NVL(:emp,'all'),'all','%',:emp)
AND   b.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY a.slno,a.cardno ASC