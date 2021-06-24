SELECT prom.cardno, prom.empname, prom.joiningdate, prom.currdesignation, prom.prodesignation, prom.currsalary, 
          prom.prosalary, prom.salarygrd, prom.effectivedate, prom.workertype, prom.remarks, prom.finmonth, 
          prom.pro_worker, prom.pro_sal_grd, emp.sectionnm, emp.departmentnm,
          (prom.currsalary + prom.prosalary)gross_salary, prom.basic_sal, prom.house_sal, prom.convence_sal, 
          prom.foodallow_sal, prom.otherallow_sal, prom.medical_sal
FROM     TB_PROMOTION_INFO prom,TB_PERSONAL_INFO emp 
WHERE prom.company  = :p_company
AND   prom.company      = emp.company
AND   prom.proyear        = :p_year
AND   prom.finmonth       = :p_month
AND   prom.cardno         = emp.cardno
AND   emp .departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   emp .sectionnm         LIKE DECODE(NVL(:p_sec,'all'),'all','%',:p_sec)
AND   emp .workertype        LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype)
AND   prom.remarks             LIKE DECODE(NVL(:p_remarks,'all'),'all','%',:p_remarks)
AND   emp .cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY prom.cardno ASC

