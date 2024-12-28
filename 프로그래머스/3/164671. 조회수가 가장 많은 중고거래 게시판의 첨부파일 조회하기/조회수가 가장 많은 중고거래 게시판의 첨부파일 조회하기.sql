SELECT '/home/grep/src/' || b.board_id || '/' || b.file_id || b.file_name || b.file_ext as FILE_PATH
FROM USED_GOODS_BOARD a, USED_GOODS_FILE b
WHERE a.board_id = b.board_id AND a.views = (
    SELECT MAX(views) FROM used_goods_board) 
ORDER BY b.file_id DESC