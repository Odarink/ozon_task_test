TRUNCATE TABLE sys3.stg_category;

INSERT INTO sys3.stg_category
SELECT
    дата,
    номер_товара,
    сумма_рекламы
--FROM sys2.marketing
FROM sys3.marketing
WHERE дата::date = {{ дата_инкремента }};