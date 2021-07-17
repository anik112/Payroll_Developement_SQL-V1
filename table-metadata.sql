SELECT table_name, column_name, data_type, data_length FROM (
SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS
WHERE table_name IN (SELECT TABLE_NAME FROM all_tables WHERE OWNER='PAYROLL')
) ORDER BY table_name,column_name ASC


--
--GRANT SELECT ON test.tb_personal_info  TO TEST