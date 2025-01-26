
INSERT INTO sys3.dds_category
SELECT 
    stg.номер_товара, 
    stg.номер_категории, 
    stg.название_категории, 
    today() AS valid_from,
    today() AS valid_from,
    max(dds.версия) + 1 AS версия
FROM sys3.stg_category stg
LEFT JOIN sys3.dds_category dds
    ON stg.номер_товара = dds.номер_товара 
WHERE dds.номер_товара IS NULL 
   OR dds.номер_категории <> stg.номер_категории;
