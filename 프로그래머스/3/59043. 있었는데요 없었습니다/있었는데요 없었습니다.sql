SELECT A.ANIMAL_ID, A.NAME
  FROM ANIMAL_INS A JOIN ANIMAL_OUTS B
  ON A.ANIMAL_ID = B.ANIMAL_ID
 WHERE A.DATETIME > B.DATETIME
 ORDER BY A.DATETIME