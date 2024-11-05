Select ID,LENGTH
From FISH_INFO
where LENGTH is not null
order by LENGTH desc ,ID asc
LIMIT 10