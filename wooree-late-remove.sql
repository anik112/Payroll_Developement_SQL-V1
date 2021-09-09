SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
               late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company =  per.company
AND    late.company     = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype       LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker) 
AND    per.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    per.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    late.cardno            LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY late.pdate, per.lineno,late.cardno ASC



---------------------- 




SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company  =  per.company
AND    late.company    = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company  =  per.company
AND    late.company    = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company  =  per.company
AND    late.company    = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company  =  per.company
AND    late.company    = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company  =  per.company
AND    late.company    = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per 
WHERE  late.company  =  per.company
AND    late.company    = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    late.cardno        =  per.cardno
AND    per.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT late.cardno, late.pdate, late.intime, late.outtime, late.duration, late.latehr, 
       late.processdate, late.processby, late.company, per.sectionnm, per.lineno, per.empname 
FROM   TB_EMP_LATE_INFO late, TB_PERSONAL_INFO per ,TB_IDCARD_MULTIPLE mul
WHERE  late.company =  per.company
AND    late.company   =  mul.company
AND    late.company  = :p_company
AND    late.pdate BETWEEN :p_sdate AND :p_edate 
AND    mul.user_name = :p_user
AND    late.cardno      =  per.cardno
AND    late.cardno      =  mul.cardno