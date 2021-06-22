SELECT b.cardno,b.empname ,b.designation, a.leave_type,a.start_date,a.end_date,
              a.reason,b.sectionnm,b.departmentnm , a.salday, b.lineno
FROM   TB_LEAVE_DETAILINFO a, TB_PERSONAL_INFO b
WHERE  b.company      = :p_company
AND    b.company          = a.company
AND    a.start_date BETWEEN :p_sdate AND :p_edate
AND    a.cardno             = b.cardno
AND    b.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    b.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    b.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY b.cardno,a.start_date ASC


---

SELECT b.cardno,b.empname ,b.designation, a.leave_type,a.start_date,a.end_date,
              a.reason,b.sectionnm,b.departmentnm , a.salday, b.lineno
FROM   TB_LEAVE_DETAILINFO a, TB_PERSONAL_INFO b
WHERE b.company         = :p_company
AND     b.company         = a.company
AND    a.finyear         = :p_year
AND    a.finmonth     = :p_month
AND    a.cardno         = b.cardno
AND    b.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    b.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    b.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY b.cardno,a.start_date ASC