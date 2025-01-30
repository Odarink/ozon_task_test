SELECT
    название_категории,
    SUM(сумма_продажи) AS сумма_продажи
FROM sys3.cdm_sales_dboard
GROUP BY название_категории
ORDER BY сумма_продажи DESC
LIMIT 5;