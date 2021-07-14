SELECT bamt.cardno, bamt.empname, bamt.enmname_bangla, bamt.lineno, bamt.lineno_bangla, bamt.departmentnm,
               bamt.dept_bangla, bamt.sectionnm, bamt.sec_bangla, bamt.machineno, bamt.designation, bamt.designation_ban,
               info.joining_date,info.designation,info.empname,bamt.jobday, bamt.jobperiod, bamt.grosssal, bamt.basicsal, 
               bamt.payable_ch, bamt.payment_ch_rd, bamt.calculation_status
FROM   TB_BONUS_AMOUNT bamt,TB_PERSONAL_INFO info
WHERE  info.company    = :p_company
AND    info.company        = bamt.company
AND    bamt.finyear          = :p_year
AND    bamt.finmonth       = :p_month
AND    bamt.payment_ch_rd   > 0
AND    info.cardno           = bamt.cardno 
AND    bamt.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    bamt.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.workertype             LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    bamt.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    bamt.floorno                    LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    bamt.machineno             LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    bamt.lineno                     LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.cash_type              LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    info.bank_name           LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type                LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status           LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bamt.sal_status            LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bamt.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    info.active                    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.lineno,bamt.cardno ASC





SELECT bamt.cardno, bamt.empname, bamt.enmname_bangla, bamt.lineno, bamt.lineno_bangla, bamt.departmentnm,
               bamt.dept_bangla, bamt.sectionnm, bamt.sec_bangla, bamt.machineno, bamt.designation, bamt.designation_ban,
               info.joining_date,info.designation,info.empname,bamt.jobday, bamt.jobperiod, bamt.grosssal, bamt.basicsal, 
               bamt.payable_ch, bamt.payment_ch_rd, bamt.stamp, bamt.payment_ch
FROM   TB_BONUS_AMOUNT bamt,TB_PERSONAL_INFO info
WHERE  info.company    = :p_company
AND    info.company        = bamt.company
AND    bamt.finyear          = :p_year
AND    bamt.finmonth       = :p_month
AND    bamt.payment_ch_rd   > 0
AND    info.cardno           = bamt.cardno 
AND    bamt.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    bamt.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.workertype             LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    bamt.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    bamt.floorno                    LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    bamt.machineno             LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    bamt.lineno                     LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.cash_type              LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    info.bank_name           LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type                LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status           LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bamt.sal_status            LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bamt.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    info.active                    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.lineno,bamt.cardno ASC



SELECT bamt.cardno, bamt.empname, bamt.enmname_bangla, bamt.lineno, bamt.lineno_bangla, bamt.departmentnm,
               bamt.dept_bangla, bamt.sectionnm, bamt.sec_bangla, bamt.machineno, bamt.designation, bamt.designation_ban,
               info.joining_date,info.designation,info.empname,bamt.jobday, bamt.jobperiod, bamt.grosssal_bk, bamt.basicsal_bk, 
               bamt.payable_bk, bamt.payment_bk_rd, bamt.stamp, bamt.payment_bk, info.ac_no, bamt.calculation_status
FROM   TB_BONUS_AMOUNT bamt,TB_PERSONAL_INFO info
WHERE  info.company    = :p_company
AND    info.company        = bamt.company
AND    bamt.finyear          = :p_year
AND    bamt.finmonth       = :p_month
AND    bamt.payment_bk_rd   > 0
AND    info.cardno           = bamt.cardno 
AND    bamt.departmentnm      LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    bamt.sectionnm            LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.workertype             LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    bamt.designation          LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    bamt.floorno                 LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    bamt.machineno          LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    bamt.lineno                  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.cash_type              LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    info.bank_name           LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type                LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status           LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bamt.sal_status            LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bamt.cardno                 LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    info.active                    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.lineno,bamt.cardno ASC




