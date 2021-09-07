SELECT prom.cardno,prom.empname,prom.prodesignation, 
               prom.joiningdate, prom.prosalary, prom.salarygrd salarygrd,prom.remarks,prom.effectivedate,
               prom.currsalary, (prom.prosalary + prom.currsalary)grosssalary, per.workertype, per.otorg, per.enmname_bangla,
               prom.designation_bangla, prom.pro_desig_bangla, prom.departmentnm, prom.dept_bangla, prom.sectionnm, prom.sect_bangla, prom.lineno
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company      = per.company
AND   prom.proyear         = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno     LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   prom.remarks        LIKE DECODE(NVL(:p_incr_status,'all'),'all','%',:p_incr_status)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   prom.cardno         LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC


SELECT prom.cardno,prom.empname,prom.prodesignation,  prom.currdesignation,prom.pro_sal_grd,
              prom.joiningdate, prom.prosalary, prom.salarygrd salarygrd,prom.remarks,prom.effectivedate,
              prom.currsalary, (prom.prosalary + prom.currsalary)grosssalary, per.workertype, per.otorg, per.enmname_bangla,
              prom.designation_bangla, prom.pro_desig_bangla, prom.departmentnm, prom.dept_bangla, prom.sectionnm, prom.sect_bangla, prom.lineno
FROM TB_PROMOTION_INFO prom, TB_PERSONAL_INFO per
WHERE prom.company  = :p_company
AND   prom.company    = per.company
AND   prom.proyear           =:p_year
AND   prom.finmonth  =:p_month
AND   prom.cardno          = per.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm       LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno     LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   prom.remarks        LIKE DECODE(NVL(:p_incr_status,'all'),'all','%',:p_incr_status)
AND   per.lineno              LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   per.gender            LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   prom.cardno         LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND   per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm, prom.cardno ASC