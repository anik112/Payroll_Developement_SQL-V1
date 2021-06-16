SELECT info.cardno, info.enmname_bangla, info.father_name_ban,  info.spouse_name_ban,  info.mother_name_ban,
	   info.designation_bangla, info.dept_bangla, info.sec_bangla, info.present_add_ban, info.permanent_add_ban, 
	   other.own_cellno, info.joining_date, info.RELIGION, info.marital_status, other.totalchild, other.malechild, 
	   other.femalechild, info.birth_date, info.company,info.grosssalary, info.bloodgroup, pic.emppicture
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO_PICTURE pic
WHERE info.company =:p_company
AND   info.company     = other.company
AND   info.company     = pic.company
AND   info.cardno        = other.cardno
AND   info.cardno        = pic.cardno
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


------------------

SELECT DISTINCT edu.highest_degree,info.company company_edu,info.cardno cardno_edu,
                edu.level_degree, edu.institute_name, edu.passing_yr, edu.class_grade, edu.subject
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company   =:p_company
AND   info.company       = edu.company
AND   info.cardno          = edu.cardno
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
ORDER BY edu.passing_yr ASC


--------------------------------------------


SELECT emp.companyname, emp.start_date ,  emp.end_date, emp.designation designation_exp,
       info.company company_exp,info.cardno card_exp
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT emp
WHERE info.company   =:p_company
AND   info.company       = emp.company
AND   info.cardno          = emp.cardno
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
ORDER BY emp.start_date ASC


----------------------------------------------


SELECT info.cardno, info.enmname_bangla, info.father_name_ban,  info.spouse_name_ban,  info.mother_name_ban,
               info.designation_bangla, info.dept_bangla, info.sec_bangla, info.present_add_ban, info.permanent_add_ban, 
               other.own_cellno, info.joining_date, info.RELIGION, info.marital_status, other.totalchild, other.malechild, 
               other.femalechild, info.birth_date, info.company,info.grosssalary, info.bloodgroup, pic.emppicture, info.workertype
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO_PICTURE pic, TB_IDCARD_MULTIPLE mul
WHERE info.company = :p_company
AND   info.company     = other.company
AND   info.company      = mul.company
AND   info.company     = pic.company
AND   info.cardno        = other.cardno
AND   info.cardno        = pic.cardno
AND   info.cardno         = mul.cardno
ORDER BY info.departmentnm, info.sectionnm, info.lineno, info.cardno ASC


----


SELECT DISTINCT edu.highest_degree,info.company company_edu,info.cardno cardno_edu,
               edu.level_degree, edu.institute_name, edu.passing_yr, edu.class_grade, edu.subject
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu, TB_IDCARD_MULTIPLE mul
WHERE info.company   =:p_company
AND   info.company      = mul.company
AND   info.company       = edu.company
AND   mul.USER_NAME      = :p_user
AND   info.cardno          = edu.cardno
AND   info.cardno         = mul.cardno
ORDER BY edu.passing_yr ASC

---


SELECT emp.companyname, emp.start_date ,  emp.end_date, emp.designation designation_exp,
               info.company company_exp,info.cardno card_exp
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT emp, TB_IDCARD_MULTIPLE mul
WHERE info.company   =:p_company
AND   info.company       = emp.company
AND   info.company      = mul.company
AND   info.cardno          = emp.cardno
AND   info.cardno         = mul.cardno
ORDER BY emp.start_date ASC