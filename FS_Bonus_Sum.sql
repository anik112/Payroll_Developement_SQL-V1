SELECT SUM(bonus.grosssal+bonus.grosssal_bk)gross_sal,SUM(bonus.payment_ch_rd+bonus.payment_bk_rd)bonus_amt, COUNT(bonus.cardno)total_emp, 
               SUM(bonus.basicsal+bonus.basicsal_bk)basic_sal, info.sectionnm
FROM   TB_BONUS_AMOUNT bonus, TB_PERSONAL_INFO info
WHERE  bonus.company  = :p_company
AND    bonus.company      = info.company
AND    bonus.finyear          = :p_year
AND    bonus.finmonth       = :p_month
AND    (bonus.payment_ch_rd+bonus.payment_bk_rd) > 0 
AND    bonus.cardno         = info.cardno
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bonus.pay_status   LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bonus.sal_status     LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
GROUP BY info.sectionnm
ORDER BY info.sectionnm ASC 



SELECT SUM(bonus.grosssal+bonus.grosssal_bk)gross_sal,SUM(bonus.payment_ch_rd+bonus.payment_pt_ch_rd+bonus.payment_bk_rd+bonus.payment_pt_bk_rd)bonus_amt,
COUNT(bonus.cardno)total_emp,SUM(bonus.basicsal+bonus.basicsal_bk)basic_sal, info.sectionnm
FROM   TB_BONUS_AMOUNT_SP bonus, TB_PERSONAL_INFO info
WHERE  bonus.company  = :p_company
AND    bonus.company      = info.company
AND    bonus.finyear          = :p_year
AND    bonus.finmonth       = :p_month
AND    (bonus.payment_ch_rd+bonus.payment_pt_ch_rd+bonus.payment_bk_rd+bonus.payment_pt_bk_rd) > 0 
AND    bonus.cardno         = info.cardno
AND    info.cash_type        LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND    info.bank_name      LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND    info.mft_type           LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    bonus.pay_status   LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status) 
AND    bonus.sal_status     LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    bonus.bonus_category   LIKE DECODE(NVL(:p_bonus_type,'all'),'all','%',:p_bonus_type)
GROUP BY info.sectionnm
ORDER BY info.sectionnm ASC 