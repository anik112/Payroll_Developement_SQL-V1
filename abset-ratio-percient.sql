SELECT a.totemp totemp,b.prsnt prsnt,(a.totemp - b.prsnt)absnt, 
       ROUND(((a.totemp - b.prsnt) * 100)/a.totemp,2)abs_percent,b.pdate 
FROM ( 
	SELECT COUNT(cardno)totemp 
	FROM   tb_personal_info 
	WHERE  active    =0 
	AND    company   =:p_company)a, 
	(SELECT COUNT(cardno)prsnt,pdate 
	FROM   tb_data_master 
	WHERE  company   =:p_com 
	AND    finyear   =:p_year 
	AND    finmonth  =:p_month 
	GROUP BY pdate 
ORDER BY pdate ASC
)b

----------------------

SELECT a.totemp totemp,b.Resign Resign, 
       ROUND((b.Resign * 100)/a.totemp,2)Rgn_percent 
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active       = 0 
AND     company   = :p_company)a, 
(SELECT COUNT(cardno)Resign 
FROM   tb_personal_info
WHERE  company                                                         = :p_company 
AND     RTRIM(TO_CHAR(RESIGNATION_DATE,'rrrr'))       = :p_year 
AND     RTRIM(TO_CHAR(RESIGNATION_DATE,'Month')) = :p_month)b


---------------


SELECT a.totemp totemp,b.JOIN JOIN, 
       ROUND((b.JOIN * 100)/a.totemp,2)Join_percent 
FROM ( 
SELECT COUNT(cardno)totemp 
FROM   tb_personal_info 
WHERE  active      = 0 
AND    company   = :p_company)a, 
(SELECT COUNT(cardno)JOIN 
FROM   tb_personal_info
WHERE  company                                              = :p_company 
AND    RTRIM(TO_CHAR(JOINING_DATE,'rrrr'))       = :p_year 
AND    RTRIM(TO_CHAR(JOINING_DATE,'Month')) = :p_month)b