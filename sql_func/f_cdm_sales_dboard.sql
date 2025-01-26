INSERT INTO sys3.cdm_sales_dboard
SELECT
    s.дата_продажи AS дата,
    s.номер_товара,
    c.название_категории AS категория,
    SUM(s.сумма_продажи) AS сумма_продаж,
    SUM(a.стоимость_рекламы) AS стоимость_рекламы,
    SUM(s.сумма_продажи) / NULLIF(SUM(a.стоимость_рекламы), 0) AS рентабельность_рекламы
FROM sales_dds s
JOIN product_category_dds c
    ON s.номер_товара = c.номер_товара
    AND s.дата_продажи >= c.valid_from
LEFT JOIN ad_investments_dds a
    ON s.номер_товара = a.номер_товара
    AND s.дата_продажи = a.дата
GROUP BY дата, номер_товара, категория;