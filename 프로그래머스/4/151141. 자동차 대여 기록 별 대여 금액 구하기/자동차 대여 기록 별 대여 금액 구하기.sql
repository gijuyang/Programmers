SELECT
    h.history_id,
    CASE 
        WHEN p.discount_rate IS NULL THEN (c.daily_fee * ((h.end_date - h.start_date) + 1))
        ELSE (c.daily_fee * ((h.end_date - h.start_date) + 1))
             -
             (
                 (c.daily_fee * ((h.end_date - h.start_date) + 1))
                 *
                 (p.discount_rate * .01)
             )
    END AS fee
FROM
    car_rental_company_car c
    INNER JOIN
    car_rental_company_rental_history h
    ON
    c.car_id = h.car_id
    LEFT OUTER JOIN
    car_rental_company_discount_plan p
    ON
    p.car_type = c.car_type
    AND
    p.duration_type = CASE WHEN ((h.end_date - h.start_date) + 1) >= 90 THEN '90일 이상'
                           WHEN ((h.end_date - h.start_date) + 1) >= 30 THEN '30일 이상'
                           WHEN ((h.end_date - h.start_date) + 1) >= 7 THEN '7일 이상'
                           ELSE ''
                      END
WHERE
    c.car_type = '트럭'
ORDER BY
    fee DESC,
    h.history_id DESC