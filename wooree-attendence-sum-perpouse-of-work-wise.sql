SELECT a.purposeofwork,NVL(a.totalcount,0) total_emp,NVL(b.presentcount,0) total_prsnt, NVL(c.leavecount,0) total_lev,
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absnt , a.sectionnm
FROM 
    (SELECT COUNT(info.cardno) totalcount,NVL(other.purposeofwork,'Z_¨ †`Iqv †bB ***') purposeofwork ,info.sectionnm 
    FROM   TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO info
    WHERE  info.company           =:p_company
    AND    info.departmentnm       = :p_dept
    AND    info.company               = other.company
    AND    info.cardno                  = other.cardno 
    GROUP BY other.purposeofwork , info.sectionnm
    )a,
    (SELECT COUNT(info.cardno) presentcount,NVL(other.purposeofwork,'Z_¨ †`Iqv †bB ***') purposeofwork ,info.sectionnm
    FROM   TB_DATA_MASTER mov,TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO info 
    WHERE  info.company              =:p_company
    AND    info.departmentnm          =:p_dept
    AND    mov.company                 =:p_com
    AND    info.company                  = other.company
    AND    mov.finyear                     = TO_CHAR(:p_date,'rrrr')
    AND    mov.finmonth                  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate                       =:p_date 
    AND    info.cardno                      = other.cardno
    AND    mov.cardno                     = info.cardno  
    GROUP BY other.purposeofwork,info.sectionnm
    )b,
    (SELECT COUNT(info.cardno) leavecount,NVL(other.purposeofwork,'Z_¨ †`Iqv †bB ***') purposeofwork ,info.sectionnm
    FROM   TB_LEAVE_DETAILINFO lea,TB_PERSONAL_INFO_OTHER other , TB_PERSONAL_INFO info
    WHERE  info.company                =:p_company
    AND    info.departmentnm            =:p_dept
    AND    info.company                    = lea.company
    AND    info.company                    = other.company
    AND    :p_date  BETWEEN lea.start_date AND lea.end_date
    AND    info.cardno                       = other.cardno
    AND    info.cardno                       = lea.cardno 
    GROUP BY other.purposeofwork,info.sectionnm
    )c 
WHERE a.purposeofwork = b.purposeofwork(+)
AND   a.purposeofwork     = c.purposeofwork(+)
AND   a.sectionnm            = b.sectionnm(+)
AND   a.sectionnm            = c.sectionnm(+)
ORDER BY a.purposeofwork ASC