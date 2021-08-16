SELECT table_name, column_name, data_type, data_length FROM (
SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS
WHERE table_name IN (SELECT TABLE_NAME FROM all_tables WHERE OWNER='PAYROLL')
) ORDER BY table_name,column_name ASC


--
--GRANT SELECT ON test.tb_personal_info  TO TEST



SELECT * FROM all_tables tbl WHERE tbl.OWNER='PAYROLL' AND tbl.INITIAL_EXTENT>16999


SELECT * FROM all_indexes tbl WHERE tbl.OWNER='PAYROLL' AND tbl.INITIAL_EXTENT>16999


DROP USER test3 CASCADE

CREATE USER test3 IDENTIFIED BY test3

GRANT DBA TO test3


SELECT * FROM (
SELECT *
FROM USER_TAB_COLUMNS
WHERE table_name IN (SELECT TABLE_NAME FROM all_tables WHERE OWNER='PAYROLL')
) ORDER BY table_name,column_name ASC

