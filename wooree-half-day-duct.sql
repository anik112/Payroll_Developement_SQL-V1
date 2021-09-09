SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount, info.lineno ,arr.remarks , 
arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE info.company       = :p_company
AND     info.company         = arr.company
AND    arr.finyear                = :p_year
AND    arr.cardno               = info.cardno
AND    mon.month_name   = arr.finmonth(+)
AND    arr.finmonth             LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype        LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno        LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    info.gender              LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND    info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm, info.sectionnm,info.lineno,mon.slno,arr.cardno ASC


SELECT arr.CARDNO, arr.FINMONTH, mon.MONTH_NAME
FROM TB_EMP_HALF_DUTY arr, TB_MONTH mon
WHERE mon.MONTH_NAME=arr.FINMONTH(+)
ORDER BY mon.SLNO ASC



----------


SELECT arr.CARDNO,info.empname,info.designation,info.SECTIONNM, (arr.AMOUNT_CH+arr.AMOUNT_BK)AMOUNT,
info.lineno ,arr.remarks , arr.HRS,arr.finMONTH, info.DEPARTMENTNM, arr.LETTER_DATE,  arr.EMP_REPLY_DATE,  arr.REASON_STATUS
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE info.company   =:p_company
AND     info.company   = arr.company
AND    arr.finYEAR                =:p_year
AND    arr.cardno                  = info.cardno
AND    mon.month_name      = arr.finmonth(+)
AND    arr.finmonth             LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype        LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno        LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    info.gender              LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND    info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.DEPARTMENTNM, info.SECTIONNM,info.lineno,mon.slno,arr.cardno ASC



SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount, 
info.lineno ,arr.remarks , arr.hrs,arr.finmonth, info.departmentnm,arr.finyear
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company =:p_company
AND    info.company   = arr.company
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    arr.finmonth             LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm         LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype        LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno        LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno                LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    info.gender              LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)  
AND    info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm, info.sectionnm,info.lineno,mon.slno,arr.cardno ASC


---------------------

SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount, info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND   info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,(arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)  
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm, (arr.amount_ch+arr.amount_bk)amount,info.lineno ,
       arr.remarks , arr.hrs,arr.finmonth, info.departmentnm
FROM   TB_EMP_HALF_DUTY arr,TB_PERSONAL_INFO info, TB_MONTH mon,TB_IDCARD_MULTIPLE mul 
WHERE  info.company = :p_company
AND    info.company   = arr.company  
AND    info.company   = mul.company
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    arr.cardno                = mul.cardno
AND    mon.month_name        = arr.finmonth(+)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)