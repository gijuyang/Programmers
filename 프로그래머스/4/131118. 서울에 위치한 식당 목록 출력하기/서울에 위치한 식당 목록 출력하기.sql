-- 코드를 입력하세요
SELECT a.REST_ID, a.REST_NAME, a.FOOD_TYPE, a.FAVORITES, a.ADDRESS, round(avg(b.REVIEW_SCORE),2) as score
from REST_INFO a
join REST_REVIEW b
on a.REST_ID=b.REST_ID
group by REST_ID
having a.address like '서울%'
order by score desc, a.FAVORITES desc