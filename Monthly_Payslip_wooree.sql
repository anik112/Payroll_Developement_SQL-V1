SELECT sal.dept_bangla, sal.sec_bangla, sal.lineno, sal.floorno, sal.machineno, per.cardno, per.enmname_bangla, per.joining_date, 
       per.resignation_date, sal.designation_ban, sal.salary_grd, mon.total_day, mon.total_leave, mon.total_present, mon.total_absent, 
       mon.late_day, sal.medical, sal.transport, sal.foodallow, sal.otherallow_bk, mon.sal_ot_hr, sal.otrate, mon.total_holiday,
       (sal.grosssal_ch + sal.grosssal_bk)grosssal, 
       (sal.basicsal_ch + sal.basicsal_bk)basicsal, 
       (sal.houserent_ch + sal.houserent_bk)houserent,
       (sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded,
       (sal.netwages_ch + sal.netwages_bk) netwages, -- check
       (sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt,
       (sal.attbonus_ch + sal.attbonus_bk)attbonus,
       (sal.advance_amt_ch + sal.advance_amt_bk + sal.adv_sal_ch + sal.adv_sal_bk)advance,
       (sal.total_ded_ch + sal.total_ded_bk)total_deduction,
       (sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt,
       (sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd,
       (sal.nt_bill_ch + sal.nt_bill_pt_ch + sal.nt_bill_bk + sal.nt_bill_pt_bk) nt_bill,  
       (sal.tiffin_bill_ch + sal.tiffin_bill_pt_ch + sal.tiffin_bill_bk + sal.tiffin_bill_pt_bk) tiffin_bill,
       (sal.gt_holi_bill_ch + sal.gt_holi_bill_bk)gt_holi_bill, 
       (sal.wk_holi_bill_bk + sal.wk_holi_bill_bk)wk_holi_bill, SIGN.empsign
FROM  TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per, TB_PERSONAL_INFO_SIGN SIGN
WHERE mon.company  = :p_company 
AND   mon.company      = sal.company 
AND   mon.company      = per.company 
AND   mon.company      = SIGN.company
AND   mon.finyear          = :p_year 
AND   mon.finmonth       = :p_month 
AND   mon.finyear          = sal.finyear 
AND   mon.finmonth       = sal.finmonth 
AND   (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND   mon.cardno         = sal.cardno 
AND   mon.cardno         = per.cardno 
AND   mon.cardno         = SIGN.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   per.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno          LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   per.lineno                      LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   per.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   sal.sal_status         LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND   sal.pay_status        LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)  
AND   per.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   per.bank_name         LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   per.mft_type            LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   per.cardno                    LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   per.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm,per.sectionnm,per.lineno,per.cardno ASC


--- total  

SELECT sal.dept_bangla, sal.sec_bangla, sal.lineno, sal.floorno, sal.machineno, per.cardno, per.enmname_bangla, per.joining_date, 
       per.resignation_date, sal.designation_ban, sal.salary_grd, mon.total_day, mon.total_leave, mon.total_present, mon.total_absent, 
       mon.late_day, sal.medical, sal.transport, sal.foodallow, sal.otherallow_bk, mon.sal_ot_hr, sal.otrate, mon.total_holiday,
       (sal.grosssal_ch + sal.grosssal_bk)grosssal, 
       (sal.basicsal_ch + sal.basicsal_bk)basicsal, 
       (sal.houserent_ch + sal.houserent_bk)houserent,
       (sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded,
       (sal.netwages_ch + sal.netwages_bk) netwages, -- check
       (sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt,
       (sal.attbonus_ch + sal.attbonus_bk)attbonus,
       (sal.advance_amt_ch + sal.advance_amt_bk + sal.adv_sal_ch + sal.adv_sal_bk)advance,
       (sal.total_ded_ch + sal.total_ded_bk)total_deduction,
       (sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt,
       (sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd,
       (sal.nt_bill_ch + sal.nt_bill_pt_ch + sal.nt_bill_bk + sal.nt_bill_pt_bk) nt_bill,  
       (sal.tiffin_bill_ch + sal.tiffin_bill_pt_ch + sal.tiffin_bill_bk + sal.tiffin_bill_pt_bk) tiffin_bill,
       (sal.gt_holi_bill_ch + sal.gt_holi_bill_bk)gt_holi_bill, 
       (sal.wk_holi_bill_bk + sal.wk_holi_bill_bk)wk_holi_bill, SIGN.empsign,5rr
	   mon.total_work_day, mon.casual, mon.medical, mon.week_day, mon.govt_day, (sal.stamp_bk+sal.stamp_ch) stamp
FROM  TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per, TB_PERSONAL_INFO_SIGN SIGN
WHERE mon.company  = :p_company 
AND   mon.company      = sal.company 
AND   mon.company      = per.company 
AND   mon.company      = SIGN.company
AND   mon.finyear          = :p_year 
AND   mon.finmonth       = :p_month 
AND   mon.finyear          = sal.finyear 
AND   mon.finmonth       = sal.finmonth 
AND   (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND   mon.cardno         = sal.cardno 
AND   mon.cardno         = per.cardno 
AND   mon.cardno         = SIGN.cardno
AND   per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND   per.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   per.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   per.machineno          LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   per.lineno                      LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   per.shift                     LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   sal.sal_status         LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND   sal.pay_status        LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)  
AND   per.cash_type          LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND   per.bank_name         LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   per.mft_type            LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   per.cardno                    LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   per.active                     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm,per.sectionnm,per.lineno,per.cardno ASC
