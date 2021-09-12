SELECT sectionnm, cardno, empname, joining_date, designation, birth_date,grosssalary, departmentnm, lineno,secreteno
FROM   TB_PERSONAL_INFO 
WHERE company                                         =:p_company 
AND    RTRIM(TO_CHAR(joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY sectionnm,lineno,cardno ASC

----------------


SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.sectionnm IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.designation IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.workertype IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info 
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.FLOORNO IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info 
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.MACHINENO IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info 
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.lineno IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info
WHERE  info.company                             = :p_company
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.shift IN (SELECT item_name FROM tb_setup_item WHERE item_name IS NOT NULL AND USER_NAME  = :p_user)
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.sectionnm, info.cardno, info.empname, info.joining_date, info.designation, 
       info.birth_date, info.grosssalary, info.departmentnm, info.lineno,info.secreteno
FROM   tb_personal_info info, tb_idcard_multiple mul
WHERE  info.company   = :p_company
AND    info.company   = mul.company
AND    mul.USER_NAME  = :p_user
AND    info.cardno    = mul.cardno    
AND    RTRIM(TO_CHAR(info.joining_date,'rrrr')) = :p_year
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)



---------


SELECT sectionnm, cardno, empname, joining_date, designation, birth_date,grosssalary, departmentnm, lineno,secreteno
FROM   tb_personal_info 
WHERE  company  =:p_company 
AND     joining_date BETWEEN :p_sdate AND :p_edate
AND    departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY sectionnm,lineno,cardno ASC