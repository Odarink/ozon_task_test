TRUNCATE TABLE sys3.stg_sales;

INSERT INTO sys3.stg_sales
SELECT
    дата,
    номер_товара,
    номер_заказа,
    сумма_продажи
--FROM sys1.sales
FROM sys3.sales
WHERE дата::date = {{ дата_инкремента }};