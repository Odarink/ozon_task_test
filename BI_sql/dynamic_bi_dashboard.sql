SELECT
    дата,
    название_категории,
    название_товара,
    сумма_продажи,
    стоимость_рекламы
FROM sys3.cdm_sales_dboard
WHERE дата BETWEEN '{{ start_date }}' AND '{{ end_date }}'
ORDER BY дата;
