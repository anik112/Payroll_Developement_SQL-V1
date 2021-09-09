SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date, info.ac_no,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND    info.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    info.designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.floorno LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno LIKE DECODE (NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.lineno LIKE DECODE (NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.cardno       LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.sectionnm, info.cardno ASC


-------------------------------

SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND    info.departmentnm IN (SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL)
AND    info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND   info.sectionnm IN (SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL)
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND   info.designation IN (SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL )
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND   info.workertype IN (SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL)
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND   info.floorno IN (SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL)
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND   info.machineno IN (SELECT item_name FROM TB_SETUP_ITEM WHERE user_name=:p_user )
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    allows.cardno       = info.cardno
AND   info.lineno IN (SELECT item_name FROM TB_SETUP_ITEM WHERE item_name IS NOT NULL)
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    info.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT allows.cardno, allows.grosssal, allows.workday, allows.netpayment, allows.txn_date,
       info.empname, info.designation, info.lineno, info.departmentnm, info.sectionnm
FROM   TB_EMP_HOLIDAY_ALLOW allows, TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE allows.company     = :p_company
AND    allows.company     = info.company
AND   allows.company     = mul.company
AND    allows.finyear       = :p_year
AND    allows.finmonth    = :p_month
AND    allows.txn_date         = :p_date
AND    mul.user_name      =:p_user
AND    allows.cardno       = info.cardno
AND   allows.cardno      = mul.cardno
