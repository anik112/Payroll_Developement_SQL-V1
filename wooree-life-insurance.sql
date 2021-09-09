SELECT cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,father_name,birth_date
FROM TB_PERSONAL_INFO
WHERE company =:p_company
AND   RTRIM(TO_CHAR(joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(joining_date,'yyyy')) LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   departmentnm    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   floorno       LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    shift       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY departmentnm,sectionnm,lineno,cardno ASC



----------------------


SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user )
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_userl)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM  TB_PERSONAL_INFO info 
WHERE info.company     =:p_company
AND   info.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL AND user_name = :p_user)
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   RTRIM(TO_CHAR(info.joining_date,'yyyy'))    LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND   info.active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND   info.gender  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.secreteno,info.empname, info.joining_date,info.designation,
       info.grosssalary,info.lineno, info.sectionnm,info.departmentnm,info.father_name,info.birth_date
FROM   TB_PERSONAL_INFO info ,TB_IDCARD_MULTIPLE mul
WHERE  info.company    = :p_company
AND    info.company        = mul.company
AND    mul.user_name      = :p_user
AND    info.cardno            = mul.cardno
AND    RTRIM(TO_CHAR(info.joining_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    RTRIM(TO_CHAR(info.joining_date,'yyyy'))     LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 



---------------


SELECT cardno,secreteno,empname,joining_date,designation,grosssalary,lineno,sectionnm,departmentnm,father_name,birth_date
FROM TB_PERSONAL_INFO
WHERE company =:p_company
AND   departmentnm    LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   sectionnm LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   floorno       LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    shift       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
ORDER BY departmentnm,sectionnm,lineno,cardno ASC