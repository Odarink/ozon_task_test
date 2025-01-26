INSERT INTO sys3.hist_category
SELECT
    номер_товара,
    название_товара,
    номер_категории,
    название_категории,
    now() as load_dt
--FROM sys1.category
FROM sys3.category;
