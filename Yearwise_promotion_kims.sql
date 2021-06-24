SELECT departmentnm, sectionnm, lineno, cardno, empname, 
              joining_date, designation, salary_grade, grosssalary  grosssalary ,
              enmname_bangla, designation_bangla, dept_bangla, sec_bangla,workertype
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   grosssalary    >  0
AND   TO_CHAR(joining_date,'RRRR')         < :p_year-1
AND   joining_date >= :p_sdate
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
AND   departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm         LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   workertype       LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND   cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY departmentnm, sectionnm, lineno,cardno ASC


---- date



SELECT departmentnm, sectionnm, lineno, cardno, empname, 
              joining_date, designation, salary_grade, grosssalary  grosssalary ,
              enmname_bangla, designation_bangla, dept_bangla, sec_bangla,workertype
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   grosssalary    >  0
AND   TO_CHAR(joining_date,'RRRR') <= :p_year-1
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
AND   joining_date <=:p_sdate
AND   cardno='7092'
AND   departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm         LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   workertype        LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND   cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY departmentnm, sectionnm, lineno,cardno ASC



SELECT departmentnm, sectionnm, lineno, cardno, empname, 
              joining_date, designation, salary_grade, grosssalary  grosssalary ,
              enmname_bangla, designation_bangla, dept_bangla, sec_bangla,workertype
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   grosssalary    >  0
AND   TO_CHAR(joining_date,'RRRR') <= :p_year-1
AND   RTRIM(TO_CHAR(joining_date,'Month')) = :p_month
AND   joining_date BETWEEN :p_sdate AND :p_edate
AND   cardno='7092'
AND   departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   sectionnm         LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   workertype        LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND   cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY departmentnm, sectionnm, lineno,cardno ASC
