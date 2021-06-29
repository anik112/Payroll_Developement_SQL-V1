SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               ABS.finyear , per.present_address, per.permanentaddress ,per.joining_date,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla, ABS.maternity_start_date,
			   ABS.maternity_end_date, ABS.maternity_resumption_date
FROM   TB_EMP_ABSENT_LETTER ABS,TB_PERSONAL_INFO per
WHERE per.company = :p_company  
AND    per.company    = ABS.company
AND    ABS.finyear      = :p_year
AND    ABS.finmonth   = :p_month
AND    ABS.fst_letter IS NOT NULL
AND    per.gender       = 'Female'
AND    ABS.cardno     = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm        LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.lineno               LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.designation      LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype       LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.shift                  LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC




SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               ABS.finyear , per.present_address, per.permanentaddress ,per.joining_date,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla, ABS.maternity_start_date,
               ABS.maternity_end_date, ABS.maternity_resumption_date
FROM   TB_EMP_ABSENT_LETTER ABS,TB_PERSONAL_INFO per
WHERE per.company = :p_company  
AND    per.company    = ABS.company
AND    ABS.finyear      = :p_year
AND    ABS.finmonth   = :p_month
AND    ABS.snd_letter IS NOT NULL
AND    per.gender       = 'Female'
AND    ABS.cardno     = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm        LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.lineno               LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.designation      LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype       LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.shift                  LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC



SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               ABS.finyear , per.present_address, per.permanentaddress ,per.joining_date,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla, ABS.maternity_start_date,
               ABS.maternity_end_date, ABS.maternity_resumption_date
FROM   TB_EMP_ABSENT_LETTER ABS,TB_PERSONAL_INFO per
WHERE per.company = :p_company  
AND    per.company    = ABS.company
AND    ABS.finyear      = :p_year
AND    ABS.finmonth   = :p_month
AND    ABS.trd_letter IS NOT NULL
AND    per.gender       = 'Female'
AND    ABS.cardno     = per.cardno
AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm        LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
AND    per.lineno               LIKE DECODE (NVL(:p_line,'all'),'all','%',:p_line)
AND    per.designation      LIKE DECODE (NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype       LIKE DECODE (NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.shift                  LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cardno             LIKE DECODE (NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC



--- SL


SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               ABS.finyear , per.present_address, per.permanentaddress ,per.joining_date,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla, ABS.maternity_start_date,
               ABS.maternity_end_date, ABS.maternity_resumption_date
FROM   TB_EMP_ABSENT_LETTER ABS,TB_PERSONAL_INFO per, TB_IDCARD_MULTIPLE mul
WHERE per.company = :p_company  
AND    per.company    = ABS.company
AND    per.company    = mul.company
AND    ABS.finyear      = :p_year
AND    ABS.finmonth   = :p_month
AND    ABS.fst_letter IS NOT NULL
AND    per.gender       = 'Female'
AND    mul.user_name = :p_user
AND    ABS.cardno      = per.cardno
AND    ABS.cardno      = mul.cardno
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC



SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               ABS.finyear , per.present_address, per.permanentaddress ,per.joining_date,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla, ABS.maternity_start_date,
               ABS.maternity_end_date, ABS.maternity_resumption_date
FROM   TB_EMP_ABSENT_LETTER ABS,TB_PERSONAL_INFO per, TB_IDCARD_MULTIPLE mul
WHERE per.company = :p_company  
AND    per.company    = ABS.company
AND    per.company    = mul.company
AND    ABS.finyear      = :p_year
AND    ABS.finmonth   = :p_month
AND    ABS.snd_letter IS NOT NULL
AND    per.gender       = 'Female'
AND    mul.user_name = :p_user
AND    ABS.cardno      = per.cardno
AND    ABS.cardno      = mul.cardno
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC



SELECT per.cardno,per.empname, per.departmentnm, per.sectionnm,per.lineno, per.designation, 
               ABS.last_pesnt_date, ABS.start_absnt_date, ABS.fst_letter, ABS.snd_letter, ABS.trd_letter, ABS.resign_date ,
               ABS.finyear , per.present_address, per.permanentaddress ,per.joining_date,
               per.father_name, per.mother_name,  per.housbandname,  per.present_add_ban,  per.permanent_add_ban,
               per.enmname_bangla,  per.designation_bangla,  per.dept_bangla,  per.sec_bangla, ABS.maternity_start_date,
               ABS.maternity_end_date, ABS.maternity_resumption_date
FROM   TB_EMP_ABSENT_LETTER ABS,TB_PERSONAL_INFO per, TB_IDCARD_MULTIPLE mul
WHERE per.company = :p_company  
AND    per.company    = ABS.company
AND    per.company    = mul.company
AND    ABS.finyear      = :p_year
AND    ABS.finmonth   = :p_month
AND    ABS.trd_letter IS NOT NULL
AND    per.gender       = 'Female'
AND    mul.user_name = :p_user
AND    ABS.cardno      = per.cardno
AND    ABS.cardno      = mul.cardno
ORDER BY per.departmentnm, per.sectionnm,per.lineno,per.cardno ASC