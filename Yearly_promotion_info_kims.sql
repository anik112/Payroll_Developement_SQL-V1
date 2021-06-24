SELECT  prom.cardno, prom.empname, prom.prodesignation,  prom.joiningdate, prom.prosalary, prom.salarygrd, prom.REMARKS, prom.EFFECTIVEDATE, prom.CURRSALARY , (prom.CURRSALARY + prom.PROSALARY)Gross_Sal
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company     = :p_company
AND   prom.company       = per.company
AND   prom.PROYEAR    = :p_year
AND   prom.FINMONTH  = :p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm         LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.workertype        LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND   prom.REMARKS LIKE DECODE(NVL(:p_remarks,'all'),'all','%',:p_remarks)
AND   per.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY prom.cardno ASC

-------


SELECT  prom.cardno, prom.empname, prom.prodesignation,  prom.joiningdate, prom.prosalary, prom.salarygrd, prom.REMARKS, prom.EFFECTIVEDATE, prom.CURRSALARY , (prom.CURRSALARY + prom.PROSALARY)Gross_Sal
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company     = :p_company
AND   prom.company       = per.company
AND   prom.EFFECTIVEDATE BETWEEN :p_sdate AND :p_edate
AND   prom.cardno          = per.cardno
AND   per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.SECTIONNM LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.WORKERTYPE LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND    prom.REMARKS LIKE DECODE(NVL(:p_remarks,'all'),'all','%',:p_remarks)
AND   prom.cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY prom.cardno ASC

