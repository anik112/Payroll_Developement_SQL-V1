-- for bank payemtn 1
SELECT bonus.cardno, emp.departmentnm, emp.dept_bangla, emp.sectionnm, emp.sec_bangla, bonus.empname, bonus.enmname_bangla,bonus.lineno, bonus.lineno_bangla,
bonus.machineno, bonus.designation, emp.joining_date, emp.salary_grade, emp.lineno,  bonus.jobday, bonus.jobperiod, bonus.jobday, bonus.jobperiod,
bonus.grosssal_bk, bonus.basicsal_bk, bonus.payable_bk , bonus.payment_bk_rd, bonus.payment_bk, bonus.calculation_status, bonus.designation_ban,
bonus.bonus_category
FROM   TB_BONUS_AMOUNT_SP bonus, TB_PERSONAL_INFO emp
WHERE  bonus.company    = :p_company
AND    bonus.company        = emp.company
AND    bonus.finyear            = :p_year
AND    bonus.finmonth         = :p_month
AND    bonus.bonus_category = :p_bonus_type
AND    bonus.cardno           = emp.cardno
AND    bonus.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    bonus.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    emp.workertype              LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    bonus.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    bonus.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    bonus.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    bonus.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    emp.shift                         LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    emp.cash_type               LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    emp.bank_name             LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    emp.mft_type                  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bonus.bonus_category   LIKE DECODE(NVL(:p_bonus_type,'all'),'all','%',:p_bonus_type)
AND    bonus.pay_status           LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bonus.sal_status            LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bonus.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    emp.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  emp.cardno ASC 


-- for BankFW payemnt 1 
SELECT bonus.cardno, bonus.departmentnm, bonus.dept_bangla, bonus.sectionnm, bonus.sec_bangla, bonus.empname, bonus.lineno_bangla,
               bonus.machineno, bonus.designation, emp.joining_date, emp.salary_grade, bonus.lineno,  bonus.jobday, bonus.jobperiod, 
               bonus.grosssal_bk, bonus.basicsal_bk, bonus.payable_bk , bonus.payment_bk_rd, bonus.payment_bk, bonus.calculation_status, bonus.designation_ban,
               bonus.bonus_category, emp.ac_no, emp.mft_acno
FROM   TB_BONUS_AMOUNT_SP bonus, TB_PERSONAL_INFO emp
WHERE  bonus.company    = :p_company
AND    bonus.company        = emp.company
AND    bonus.finyear            = :p_year
AND    bonus.finmonth         = :p_month
AND    bonus.bonus_category = :p_bonus_type
AND    bonus.cardno           = emp.cardno
AND    bonus.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    bonus.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    emp.workertype              LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    bonus.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    bonus.floorno                  LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    bonus.machineno           LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    bonus.lineno                   LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    emp.shift                         LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    emp.cash_type               LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    emp.bank_name             LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    emp.mft_type                  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bonus.bonus_category   LIKE DECODE(NVL(:p_bonus_type,'all'),'all','%',:p_bonus_type)
AND    bonus.pay_status           LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bonus.sal_status            LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bonus.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    emp.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  emp.cardno ASC 


-- for cash payemtn 2 
SELECT bonus.cardno, emp.departmentnm, emp.dept_bangla, emp.sectionnm, emp.sec_bangla, bonus.empname, bonus.enmname_bangla,bonus.lineno, bonus.lineno_bangla,
               bonus.machineno, bonus.designation,  bonus.designation_ban, emp.joining_date, emp.salary_grade,  bonus.jobday, bonus.jobperiod, bonus.jobday, bonus.jobperiod,
               bonus.grosssal, bonus.basicsal, bonus.payable_ch, bonus.payment_ch_rd, bonus.stamp, bonus.payment_ch, bonus.calculation_status, bonus.bonus_category
FROM   TB_BONUS_AMOUNT_SP bonus, TB_PERSONAL_INFO emp
WHERE  bonus.company   = :p_company
AND    bonus.company       = emp.company
AND    bonus.finyear           = :p_year
AND    bonus.finmonth        = :p_month
AND    bonus.bonus_category = :p_bonus_type
AND    bonus.cardno           = emp.cardno
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
AND    bonus.BONUS_CATEGORY  LIKE DECODE(NVL(:p_bonus_type,'all'),'all','%',:p_bonus_type)
AND    bonus.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    emp.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY  emp.cardno ASC 
