TRUNCATE TABLE sys3.stg_category;

INSERT INTO sys3.stg_category
SELECT
    номер_товара,
    название_товара,
    номер_категории,
    название_категории
--FROM sys1.category
FROM sys3.category;
