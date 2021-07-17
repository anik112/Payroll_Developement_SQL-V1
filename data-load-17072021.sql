
DECLARE
v_macno TB_DATA_MOVEMENT.MACNO%TYPE;
v_secno TB_DATA_MOVEMENT.SECRETENO%TYPE;
v_date	VARCHAR(250 BYTE);
v_time	TB_DATA_MOVEMENT.PTIME%TYPE;
v_status TB_DATA_MOVEMENT.STATUS%TYPE;

CURSOR cur_data IS (
	   SELECT secreteno,TO_CHAR(pdate,'yyyyMMDD'),(SUBSTR(ptime,1,2)||SUBSTR(ptime,4,2)||SUBSTR(ptime,7,2)),status 
FROM TB_DATA_MOVEMENT WHERE pdate='16-June-2021'
AND  cardno IN (SELECT cardno FROM TB_ROASTER_INFO WHERE rdate='16-June-2021' AND presentshift='A' or presentshift='G')
and  secreteno is not null
);

BEGIN
DBMS_OUTPUT.ENABLE(1000000); 
	 OPEN cur_data;
	 LOOP
	 FETCH cur_data INTO v_secno, v_date, v_time, v_status;
	 EXIT WHEN cur_data%NOTFOUND;
	 DBMS_OUTPUT.PUT_LINE('102'||':'||v_secno||':'||v_date||':'||v_time||':'||v_status);
	 END LOOP;
	 CLOSE cur_data;
END;
