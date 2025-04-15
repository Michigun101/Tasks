-- Необходимо вывести количество людей, которые покупали товар с id = 5 после 10 октября 2021 (включительно).
-- https://itresume.ru/uploads/images/problems/alfa.png
select count(distinct user_id)
from purchases
where sku_id = 5
and created_at >= '2021-10-10'

2.


\