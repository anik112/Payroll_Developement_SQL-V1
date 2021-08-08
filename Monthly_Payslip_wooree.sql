SELECT sal.DEPT_BANGLA, sal.SEC_BANGLA, sal.LINENO, sal.FLOORNO, sal.MACHINENO, per.CARDNO, per.ENMNAME_BANGLA, per.JOINING_DATE, 
       per.RESIGNATION_DATE, sal.DESIGNATION_BAN, sal.SALARY_GRD, mon.TOTAL_DAY, mon.TOTAL_LEAVE, mon.TOTAL_PRESENT, mon.TOTAL_ABSENT, 
       mon.LATE_DAY, sal.MEDICAL, sal.TRANSPORT, sal.FOODALLOW, sal.OTHERALLOW_BK, mon.SAL_OT_HR, sal.OTRATE, mon.TOTAL_HOLIDAY,
       (sal.GROSSSAL_CH + sal.GROSSSAL_BK)GROSSSAL, 
       (sal.BASICSAL_CH + sal.BASICSAL_BK)BASICSAL, 
       (sal.HOUSERENT_CH + sal.HOUSERENT_BK)HOUSERENT,
       (sal.TOTAL_ABSENT_DED_CH + sal.TOTAL_ABSENT_DED_BK)TOTAL_ABSENT_DED,
       (sal.NETWAGES_CH + sal.NETWAGES_BK) NETWAGES, -- check
       (sal.SAL_OT_AMT_CH + sal.SAL_OT_AMT_BK)SAL_OT_AMT,
       (sal.ATTBONUS_CH + sal.ATTBONUS_BK)ATTBONUS,
       (sal.ADVANCE_AMT_CH + sal.ADVANCE_AMT_BK + sal.ADV_SAL_CH + sal.ADV_SAL_BK)ADVANCE,
       (sal.TOTAL_DED_CH + sal.TOTAL_DED_BK)TOTAL_DEDUCTION,
       (sal.ARREAR_AMT_CH + sal.ARREAR_AMT_BK)ARREAR_AMT,
       (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD)NETPAYMENT_RD,
       (sal.NT_BILL_CH + sal.NT_BILL_PT_CH + sal.NT_BILL_BK + sal.NT_BILL_PT_BK) NT_BILL,  
       (sal.TIFFIN_BILL_CH + sal.TIFFIN_BILL_PT_CH + sal.TIFFIN_BILL_BK + sal.TIFFIN_BILL_PT_BK) TIFFIN_BILL,
       (sal.GT_HOLI_BILL_CH + sal.GT_HOLI_BILL_BK)GT_HOLI_BILL, 
       (sal.WK_HOLI_BILL_BK + sal.WK_HOLI_BILL_BK)WK_HOLI_BILL, SIGN.EMPSIGN
FROM  TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per, TB_PERSONAL_INFO_SIGN SIGN
WHERE mon.company  = :p_company 
AND   mon.company      = sal.company 
AND   mon.company      = per.company 
AND   mon.company      = SIGN.company
AND   mon.finyear          = :p_year 
AND   mon.finmonth       = :p_month 
AND   mon.finyear          = sal.finyear 
AND   mon.finmonth       = sal.finmonth 
AND   (sal.NETPAYMENT_CH_RD + sal.NETPAYMENT_BK_RD) > 0 
AND   mon.cardno         = sal.cardno 
AND   mon.cardno         = per.cardno 
AND   mon.cardno         = SIGN.cardno
AND   per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.SECTIONNM          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.DESIGNATION       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.WORKERTYPE      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   per.FLOORNO              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.MACHINENO          LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   per.lineno                      LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   per.SHIFT                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   sal.SAL_STATUS         LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND   sal.PAY_STATUS        LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)  
AND   per.CASH_TYPE          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   per.BANK_NAME         LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   per.MFT_TYPE            LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   per.cardno                    LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   per.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.DEPARTMENTNM,per.SECTIONNM,per.lineno,per.cardno ASC
