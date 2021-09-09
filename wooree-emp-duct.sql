SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company   = :p_company
AND       info.company   = arr.company  
AND       arr.finyear        = :p_year
AND       arr.finmonth     = :p_month
AND       arr.cardno       = info.cardno
AND       info.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND       info.sectionnm         LIKE DECODE(NVL(:p_sect,'all'),'all','%',:p_sect)
AND       info.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND       info.workertype        LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND       info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND       info.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND       info.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND       info.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND       arr.ded_status         LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
AND       info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND       info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm, info.sectionnm, info.lineno,arr.cardno ASC


INSERT INTO TB_EMP_DEDUCTION_BILL (cardno, finyear, finmonth, amount, ded_status, remarks, company)
(SELECT cardno, 2021, 'August', 400, 'Punishment', 'give punishment', company FROM TB_PERSONAL_INFO)

---------


SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company   = :p_company  
AND    info.company      = arr.company
AND    arr.finyear        = :p_year
AND    arr.finmonth    = :p_month
AND    arr.cardno          = info.cardno
AND    info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company       = :p_company  
AND    info.company          = arr.company
AND    arr.finyear             = :p_year
AND    arr.finmonth         = :p_month
AND    arr.cardno               = info.cardno
AND    info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company       = :p_company  
AND     info.company         = arr.company
AND    arr.finyear             = :p_year
AND    arr.finmonth         = :p_month
AND    arr.cardno               = info.cardno
AND    info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company       = :p_company  
AND     info.company         = arr.company
AND    arr.finyear             = :p_year
AND    arr.finmonth         = :p_month
AND    arr.cardno               = info.cardno
AND    info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company       = :p_company  
AND    info.company          = arr.company
AND    arr.finyear             = :p_year
AND    arr.finmonth         = :p_month
AND    arr.cardno               = info.cardno
AND    info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company       = :p_company  
AND    info.company          = arr.company
AND    arr.finyear             = :p_year
AND    arr.finmonth         = :p_month
AND    arr.cardno               = info.cardno
AND    info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info
WHERE info.company       = :p_company  
AND    info.company          = arr.company
AND    arr.finyear             = :p_year
AND    arr.finmonth         = :p_month
AND    arr.cardno               = info.cardno
AND    info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.ded_status LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE  info.company  = :p_company
AND    info.company      = arr.company
AND    info.company      = mul.company
AND    arr.finyear         = :p_year
AND    arr.finmonth     = :p_month
AND    mul.user_name = :p_user
AND    arr.cardno          = mul.cardno
AND    arr.cardno          = info.cardno


---



SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.amount,info.lineno ,arr.remarks , info.departmentnm,arr.finyear,arr.finmonth, arr.ded_status
FROM   TB_EMP_DEDUCTION_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company    =:p_company
AND    info.company      = arr.company
AND    mon.month_name  = arr.finmonth(+)
AND    arr.cardno                   = info.cardno
AND       info.departmentnm   LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND       info.sectionnm         LIKE DECODE(NVL(:p_sect,'all'),'all','%',:p_sect)
AND       info.designation       LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND       info.workertype        LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND       info.floorno              LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND       info.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND       info.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND       info.gender             LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND       arr.ded_status         LIKE DECODE(NVL(:p_ded_status,'all'),'all','%',:p_ded_status)
AND       info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND       info.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.departmentnm, info.sectionnm, info.lineno,arr.cardno,arr.finyear,mon.slno ASC