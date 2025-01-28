insert into sys3.cdm_sales_dboard (
                                    дата,
                                    название_категории,
                                    название_товара,
                                    номер_заказа,
                                    сумма_продажи,
                                    стоимость_рекламы
)
with cat_pr as (
    select
        lcp.hk_product_id,
        lcp.hk_category_id,
        scp.date_from,
        lag(hk_category_id) over(partition by lcp.hk_product_id order by scp.date_from) as lag_category
    from sys3.link_category_product lcp
    join sys3.sat_category_product scp on lcp.hk_category_product_id = scp.hk_category_product_id
    ), cat_change as (
    select
        hk_product_id,
        hk_category_id,
        date_from,
        sum(case when hk_category_id=lag_category then 0 else 1 end) over (partition by hk_product_id order by date_from) as category_change_flag
    from cat_pr
    ), cat_interval as (
    select
        hk_product_id,
        hk_category_id,
        category_change_flag,
        min(date_from) as date_from,
        max(date_from) as date_to
    from cat_change
    group by 1,2,3
    )
select
    ss.sale_dt as дата,
    sc.category_name as название_категории,
    sp.product_name as название_товара,
    hs.sale_id as номер_заказа,
    ssp.sale_amount as сумма_продажи,
    sm.amount as стоимость_рекламы
from sys3.link_sales_product_id lsp
join sys3.hub_sales hs on lsp.hk_sales_id = hs.hk_sales_id
join sys3.sat_sales ss on hs.hk_sales_id = ss.hk_sales_id
join sys3.sat_sales_product ssp on lsp.hk_sales_product_id = ssp.hk_sales_product_id
join sys3.hub_product hp on lsp.hk_product_id = hp.hk_product_id
join sys3.sat_product sp on hp.hk_product_id = sp.hk_product_id
join cat_interval ci on ci.hk_product_id = sp.hk_product_id
                            and ss.sale_dt::date>=ci.date_from::date
                            and ss.sale_dt::date<=ci.date_to::date
join sys3.hub_category hc on ci.hk_category_id = hc.hk_category_id
join sys3.sat_category sc on hc.hk_category_id = sc.hk_category_id
join sys3.hub_marketing hm on hp.hk_product_id = hm.hk_product_id and ss.sale_dt::date = hm.marketing_dt::date
join sys3.sat_marketing sm on hm.hk_marketing_id = sm.hk_marketing_id;

OPTIMIZE TABLE sys3.cdm_sales_dboard;