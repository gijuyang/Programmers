SELECT
    EXTRACT(MONTH FROM A.START_DATE) AS MONTH, 
    A.CAR_ID,
    COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A
JOIN (
    SELECT 
        CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE TO_CHAR(START_DATE, 'YYYY-MM') BETWEEN '2022-08' AND '2022-10'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
) B ON A.CAR_ID = B.CAR_ID
WHERE TO_CHAR(A.START_DATE, 'YYYY-MM') BETWEEN '2022-08' AND '2022-10'
GROUP BY EXTRACT(MONTH FROM A.START_DATE), A.CAR_ID
ORDER BY EXTRACT(MONTH FROM A.START_DATE) ASC, A.CAR_ID DESC;