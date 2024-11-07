select a.ID, count(b.ID) CHILD_COUNT
FROM ECOLI_DATA a
left join ECOLI_DATA b
ON a.ID = b.PARENT_ID
group by a.ID
order by a.ID asc