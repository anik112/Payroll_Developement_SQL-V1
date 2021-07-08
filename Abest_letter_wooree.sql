SELECT per.cardno, per.empname, per.departmentnm, per.sectionnm, per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date , ABS.emp_letter_dt, ABS.remarks
FROM   tb_emp_absent_letter ABS,tb_personal_info per
WHERE per.company   = :p_company  
AND    per.company      = ABS.company
AND    ABS.finyear        = :p_year
AND    ABS.finmonth     = :p_month
AND    ABS.cardno       = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation     LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype      LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC





SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
       ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
       (ABS.finyear||'/ '||per.cardno||'/ ' ||1)slno, ABS.finyear , per.present_address, per.permanentaddress ,
       per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
       per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla,
       per.present_add_ban, per.permanent_add_ban, per.present_po_ban, per.present_ps_ban, per.present_dist_ban, per.permanent_po_ban, per.permanent_ps_ban, per.permanent_dist_ban
FROM   tb_emp_absent_letter ABS,tb_personal_info per
WHERE per.company  = :p_company  
AND    per.company  = ABS.company
AND    ABS.finyear     = :p_year
AND    ABS.finmonth  = :p_month
AND    ABS.fst_letter IS NOT NULL
AND    ABS.cardno       = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation     LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype      LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC



SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               (ABS.finyear||'/ '||per.cardno||'/ ' ||1)slno, ABS.finyear , per.present_address, per.permanentaddress ,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla,
               per.present_add_ban, per.permanent_add_ban, per.present_po_ban, per.present_ps_ban, per.present_dist_ban, per.permanent_po_ban, per.permanent_ps_ban, per.permanent_dist_ban
FROM   tb_emp_absent_letter ABS,tb_personal_info per
WHERE per.company   = :p_company  
AND    per.company      = ABS.company
AND    ABS.finyear        = :p_year
AND    ABS.finmonth     = :p_month
AND    ABS.snd_letter IS NOT NULL
AND    ABS.cardno       = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation     LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype      LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC




SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               (ABS.finyear||'/ '||per.cardno||'/ ' ||1)slno, ABS.finyear , per.present_address, per.permanentaddress ,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla,
               per.present_add_ban, per.permanent_add_ban, per.present_po_ban, per.present_ps_ban, per.present_dist_ban, per.permanent_po_ban, per.permanent_ps_ban, per.permanent_dist_ban
FROM   tb_emp_absent_letter ABS,tb_personal_info per, tb_idcard_multiple mul
WHERE per.company   = :p_company  
AND    per.company      = ABS.company
AND    per.company    = mul.company
AND    ABS.finyear        = :p_year
AND    ABS.finmonth     = :p_month
AND    ABS.fst_letter IS NOT NULL
AND    mul.user_name = :p_user
AND    ABS.cardno       = per.cardno
AND    ABS.cardno     = mul.cardno
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC





SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               (ABS.finyear||'/ '||per.cardno||'/ ' ||1)slno, ABS.finyear , per.present_address, per.permanentaddress ,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla,
               per.present_add_ban, per.permanent_add_ban, per.present_po_ban, per.present_ps_ban, per.present_dist_ban, per.permanent_po_ban, per.permanent_ps_ban, per.permanent_dist_ban
FROM   tb_emp_absent_letter ABS,tb_personal_info per, tb_idcard_multiple mul
WHERE per.company   = :p_company  
AND    per.company      = ABS.company
AND    per.company    = mul.company
AND    ABS.finyear        = :p_year
AND    ABS.finmonth     = :p_month
AND    ABS.snd_letter IS NOT NULL
AND    mul.user_name = :p_user
AND    ABS.cardno       = per.cardno
AND    ABS.cardno     = mul.cardno
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC




SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               (ABS.finyear||'/ '||per.cardno||'/ ' ||1)slno, ABS.finyear , per.present_address, per.permanentaddress ,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla,
               per.present_add_ban, per.permanent_add_ban, per.present_po_ban, per.present_ps_ban, per.present_dist_ban, per.permanent_po_ban, per.permanent_ps_ban, per.permanent_dist_ban
FROM   tb_emp_absent_letter ABS,tb_personal_info per
WHERE per.company   = :p_company  
AND    per.company      = ABS.company
AND    ABS.finyear        = :p_year
AND    ABS.finmonth     = :p_month
AND    ABS.trd_letter IS NOT NULL
AND    ABS.cardno       = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.designation     LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype      LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC



SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               (ABS.finyear||'/ '||per.cardno||'/ ' ||1)slno, ABS.finyear , per.present_address, per.permanentaddress ,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla,
               per.present_add_ban, per.permanent_add_ban, per.present_po_ban, per.present_ps_ban, per.present_dist_ban, per.permanent_po_ban, per.permanent_ps_ban, per.permanent_dist_ban
FROM   tb_emp_absent_letter ABS,tb_personal_info per, tb_idcard_multiple mul
WHERE per.company   = :p_company  
AND    per.company      = ABS.company
AND    per.company    = mul.company
AND    ABS.finyear        = :p_year
AND    ABS.finmonth     = :p_month
AND    ABS.trd_letter IS NOT NULL
AND    mul.user_name = :p_user
AND    ABS.cardno       = per.cardno
AND    ABS.cardno     = mul.cardno
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC