SELECT empname,cardno,designation,sectionnm,joining_date,salary_grade,grosssalary,workertype,
              200 medical,tsalary basic,ROUND(tsalary*.3) house,
              ROUND(tsalary/208*2,2) ot , grosssalary -(tsalary + ROUND(tsalary*.3) + 200) other
FROM   tb_personal_info
WHERE  company = :p_company
AND    sectionnm  LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    cardno       LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY sectionnm,lineno,cardno ASC