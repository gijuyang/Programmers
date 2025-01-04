SELECT
    A.item_id,
    A.item_name
FROM
    item_info A
    JOIN item_tree B
    ON A.item_id = B.item_id
    AND B.parent_item_id IS NULL
ORDER BY
    ITEM_ID;