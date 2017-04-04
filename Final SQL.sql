select NVL(to_char(ts."DATE",'W'), 'Total') as "Week Number", SUM(tm.AMOUNT) as "Membership Amount", 
SUM(ts.AMOUNT) as "Merchandise Amount", 
SUM(tp.AMOUNT) + SUM(oza.AMOUNT) as "Other Amount"
from PEARS.T_MEMBER tm
JOIN PEARS.T_SALE ts ON (ts."DATE" = tm."DATE")
JOIN PEARS.T_PASS tp ON (tp."DATE" = tm."DATE")
JOIN PEARS."OTHERS" oza ON (oza."DATE" = tm."DATE")
WHERE tm."DATE" between '01-JAN-16' AND '31-JAN-16'
GROUP BY ROLLUP(to_char(ts."DATE",'W'))
ORDER BY 1;

CREATE TABLE PEARS.REVENUETABLE AS (SELECT * FROM PEARS.T_SALE
UNION
SELECT * FROM PEARS.T_MEMBER
UNION
SELECT * FROM PEARS.T_PASS
UNION
SELECT * FROM PEARS."OTHERS");



SELECT NVL(to_char(rt."DATE",'W'), 'Total') as "Week Number",

-- Selects the week number, replacing "null" with Total.
                
                NVL(sum(decode(typeid,1,amount)),0) Merchandise,

-- Decoding Merchandise ID Number 1.

                NVL(sum(decode(typeid,2,amount)),0) Memberships,

-- Decoding Merchandise ID Number 2.

                NVL(sum(decode(typeid,3,amount)),0) Other,

-- Decoding Merchandise ID Number 3.

                SUM(amount) TOTAL 

-- Total of all ID Amounts.

           FROM pears.REVENUETABLE rt
           
           WHERE rt."DATE" between '01-JAN-16' AND '31-JAN-16'
      
       GROUP BY CUBE(to_char(rt."DATE",'W'))

-- Cube grouping in a hiearchial level--week wise.

ORDER BY 1;

-- Order by the First Week.
