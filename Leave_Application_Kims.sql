SELECT lev.cardno, lev.ca_leave, lev.taken_ca, lev.aval_ca, lev.med_leave, lev.taken_med, lev.aval_med, 
       lev.ear_leave, lev.taken_ear, lev.aval_ear, lev.com_leave, lev.taken_com, lev.aval_com, 
	   lev.other_leave, lev.taken_other, lev.aval_other,per.departmentnm, per.sectionnm, per.lineno, 
	   per.empname, per.joining_date, per.designation, per.salary_grade, per.enmname_bangla, 
	   per.designation_bangla, per.dept_bangla, per.sec_bangla, other.own_cellno
FROM  TB_LEAVE_MASTERINFO lev, TB_PERSONAL_INFO per, TB_PERSONAL_INFO_OTHER other
WHERE lev.company   = :p_company
AND   lev.company   = per.company
AND   lev.company   = other.company
AND   lev.finyear   = :p_year
AND   lev.cardno    = per.cardno
AND   lev.cardno    = other.cardno
AND   per.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   per.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY per.departmentnm, per.sectionnm, per.cardno ASC