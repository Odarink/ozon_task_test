SELECT
    дата,
    SUM(сумма_продажи) AS общая_выручка
FROM sys3.cdm_sales_dboard
GROUP BY дата
ORDER BY дата;