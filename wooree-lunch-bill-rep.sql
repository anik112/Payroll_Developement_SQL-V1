SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount,info.lineno  , arr.processby, arr.finmonth, arr.item_status, arr.remarks, 
          info.departmentnm,arr.lunch_date 
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company  =:p_company
AND    info.company   = arr.company
AND    arr.finyear              = :p_year
AND    arr.cardno                = info.cardno
AND    mon.month_name    = arr.finmonth(+)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm  LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype  LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.item_status LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
ORDER BY mon.slno,info.lineno,arr.cardno ASC


-----


SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status, arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company   = :p_company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status, arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company  = :p_company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status, arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company   = :p_company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status, arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company   = :p_company
AND     info.company      = arr.company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status,  arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company  = :p_company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status,  arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company  = :p_company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status,  arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company  = :p_company
AND     info.company      = arr.company
AND    arr.finyear             = :p_year
AND    arr.cardno            = info.cardno
AND    mon.month_name= arr.finmonth(+)
AND    info.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    arr.finmonth       LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    arr.item_status   LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
AND    info.gender        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active         LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount, arr.item_status, arr.remarks, 
       info.lineno  , arr.processby, arr.finmonth,
       info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon, TB_IDCARD_MULTIPLE mul
WHERE  info.company = :p_company
AND    info.company     = arr.company
AND    info.company     = mul.company
AND    arr.finyear           = :p_year
AND    mul.user_name   = :p_user
AND    arr.cardno          = mul.cardno
AND    arr.cardno          = info.cardno
AND    mon.month_name = arr.finmonth(+)


-------------



SELECT arr.cardno,info.empname,info.designation,info.sectionnm,arr.launch_amount,info.lineno  , arr.processby, arr.finmonth, arr.finyear,
          info.departmentnm,arr.lunch_date
FROM   TB_EMP_LAUNCH_BILL arr,TB_PERSONAL_INFO info, TB_MONTH mon
WHERE  info.company   = :p_company
AND     info.company    = arr.company
AND    arr.cardno          = info.cardno
AND    mon.month_name     = arr.finmonth(+)
AND    arr.finmonth LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm  LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype  LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno  LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno  LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    arr.item_status LIKE DECODE(NVL(:p_it_status,'all'),'all','%',:p_it_status)
ORDER BY mon.slno,info.lineno,arr.cardno ASC