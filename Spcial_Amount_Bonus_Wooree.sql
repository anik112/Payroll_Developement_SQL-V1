SELECT emp.CARDNO, emp.DEPARTMENTNM, emp.SECTIONNM, emp.EMPNAME, emp.DESIGNATION,
	   emp.JOINING_DATE, emp.SALARY_GRADE , emp.lineno,
	   bonus.JOBDAY, bonus.JOBPERIOD, bonus.GROSSSAL, bonus.BASICSAL, bonus.TOT_PAYMENT, bonus.NPAYMENT, bonus.NPAYMENT1, 
	   bonus.RPAYMENT, bonus.RPAYMENT1, bonus.USELESS, bonus.NPAYABLE,  bonus.NPAYABLE1, bonus.STAMP
FROM   TB_BONUS_AMOUNT_SP bonus, TB_PERSONAL_INFO emp
WHERE  bonus.COMPANY   = :p_company
AND    bonus.COMPANY     = emp.COMPANY
AND    bonus.finyear            = :p_year
AND    bonus.finmonth         = :p_month
AND    bonus.BONUS_CATEGORY = :p_bonus_type
AND    bonus.CARDNO       = emp.CARDNO
AND    bonus.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    bonus.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    emp.workertype             LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    bonus.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    bonus.floorno                 LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    bonus.machineno          LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    bonus.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    emp.shift                        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    emp.cash_type              LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    emp.bank_name            LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    emp.mft_type                 LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bonus.pay_status           LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bonus.sal_status            LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bonus.bonus_category  LIKE DECODE(NVL(:p_bonus_type,'all'),'all','%',:p_bonus_type)
AND    bonus.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    emp.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  emp.CARDNO ASC 