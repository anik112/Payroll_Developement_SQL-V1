SELECT info.departmentnm, info.sectionnm, info.dept_bangla, info.sec_bangla, info.lineno, info.lineno_bangla, 
              info.empname, info.enmname_bangla, info.joining_date, bamt.designation, bamt.designation_ban, bamt.sal_grd,
              bamt.grosssal_ch, bamt.basicsal_ch, bamt.attn_day_percent, bamt.payable_ch, bamt.stamp, bamt.payment_ch, bamt.payment_ch_rd, info.cardno
FROM   TB_SALARY_HALF_AMOUNT bamt, TB_PERSONAL_INFO info
WHERE  info.company =  bamt.company
AND    info.company     = :p_company
AND    bamt.finyear       = :p_year
AND    bamt.finmonth    = :p_month
AND    bamt.payment_ch_rd  > 0 
AND    info.cardno         =  bamt.cardno
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.floorno             LIKE DECODE(NVL(:p_floor,'all'),'all','%',:p_floor) 
AND    info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND    info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status     LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    bamt.paid_status    LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status) 
AND    info.cardno             LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)  
AND    info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
ORDER BY info.departmentnm,info.sectionnm,info.lineno,bamt.cardno ASC

--- for bank 

SELECT info.departmentnm, info.sectionnm, info.dept_bangla, info.sec_bangla, info.lineno, info.lineno_bangla, info.ac_no, info.mft_acno
              info.empname, info.enmname_bangla, info.joining_date, bamt.designation, bamt.designation_ban, bamt.sal_grd,
              bamt.grosssal_bk , bamt.basicsal_bk, bamt.attn_day_percent, bamt.payable_bk, bamt.payment_bk, bamt.payment_bk_rd, info.cardno
FROM   TB_SALARY_HALF_AMOUNT bamt, TB_PERSONAL_INFO info
WHERE  info.company =  bamt.company
AND    info.company     = :p_company
AND    bamt.finyear       = :p_year
AND    bamt.finmonth    = :p_month
AND    bamt.payment_bk_rd  > 0 
AND    info.cardno         =  bamt.cardno
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.floorno             LIKE DECODE(NVL(:p_floor,'all'),'all','%',:p_floor) 
AND    info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND    info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status     LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    bamt.paid_status    LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status) 
AND    info.cardno             LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)  
AND    info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
ORDER BY info.departmentnm,info.sectionnm,info.lineno,bamt.cardno ASC


-- dummury cash 

SELECT info.sectionnm, SUM(bamt.grosssal_ch)grosssal, SUM(bamt.basicsal_ch)basicsal, 
       SUM(bamt.payable_ch)payable, SUM(bamt.stamp)stamp, SUM(bamt.payment_ch)payment, 
	   SUM(bamt.payment_ch_rd)payment, COUNT(info.cardno)cardno
FROM   TB_SALARY_HALF_AMOUNT bamt, TB_PERSONAL_INFO info
WHERE  info.company =  bamt.company
AND    info.company     = :p_company
AND    bamt.finyear       = :p_year
AND    bamt.finmonth    = :p_month
AND    bamt.payment_ch_rd  > 0 
AND    info.cardno         =  bamt.cardno
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.floorno             LIKE DECODE(NVL(:p_floor,'all'),'all','%',:p_floor) 
AND    info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND    info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status     LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    bamt.paid_status    LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status) 
AND    info.cardno             LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)  
AND    info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
GROUP BY info.sectionnm
ORDER BY info.sectionnm ASC



-- summury bank  
SELECT info.sectionnm, SUM(bamt.grosssal_bk+bamt.grosssal_ch)grosssal, SUM(bamt.basicsal_bk)basicsal, 
              SUM(bamt.payable_bk)payable, SUM(bamt.stamp)stamp, SUM(bamt.payment_bk)payment, 
              SUM(bamt.payment_bk_rd)payment_rd, COUNT(info.cardno)cardno
FROM   TB_SALARY_HALF_AMOUNT bamt, TB_PERSONAL_INFO info
WHERE  info.company =  bamt.company
AND    info.company     = :p_company
AND    bamt.finyear       = :p_year
AND    bamt.finmonth    = :p_month
AND    bamt.payment_bk_rd  > 0 
AND    info.cardno         =  bamt.cardno
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.floorno             LIKE DECODE(NVL(:p_floor,'all'),'all','%',:p_floor) 
AND    info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND    info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status     LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    bamt.paid_status    LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status) 
AND    info.cardno             LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)  
AND    info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
GROUP BY info.sectionnm
ORDER BY info.sectionnm ASC

-- summary all  
SELECT info.sectionnm, SUM(bamt.grosssal_bk+bamt.grosssal_ch)grosssal, SUM(bamt.basicsal_bk+bamt.basicsal_ch)basicsal, 
              SUM(bamt.payable_bk+bamt.payable_ch)payable, SUM(bamt.stamp)stamp, SUM(bamt.payment_bk+bamt.payment_ch)payment, 
              SUM(bamt.payment_bk_rd+bamt.payment_ch_rd)payment_rd, COUNT(info.cardno)cardno
FROM   TB_SALARY_HALF_AMOUNT bamt, TB_PERSONAL_INFO info
WHERE  info.company =  bamt.company
AND    info.company     = :p_company
AND    bamt.finyear       = :p_year
AND    bamt.finmonth    = :p_month
AND    (bamt.payment_bk_rd+bamt.payment_ch_rd) > 0 
AND    info.cardno         =  bamt.cardno
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    info.floorno             LIKE DECODE(NVL(:p_floor,'all'),'all','%',:p_floor) 
AND    info.machineno       LIKE DECODE(NVL(:p_machine,'all'),'all','%',:p_machine)
AND    info.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type)  
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bamt.pay_status     LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    bamt.paid_status    LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status) 
AND    info.cardno             LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno)  
AND    info.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)  
GROUP BY info.sectionnm
ORDER BY info.sectionnm ASC