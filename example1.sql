select stock_data.stock_code, stock_list.name, count(*) days
from calendar
join stock_data on calendar.date = stock_data.date	-- JOIN股價資訊資料表，兩個資料表透過日期來產生關聯
join stock_list on stock_list.stock_code = stock_data.stock_code	-- JOIN股票資訊資料表，兩個資料表透過股票代號來產生關聯
where stock_data.d >= 1	-- 找尋符合漲跌價差 >= 1
and year(calendar.date) = 2023	-- ，且為今年
and month(calendar.date) = 3	-- 3月的資料
group by stock_data.stock_code, stock_list.name	-- 藉由股票代號、公司名稱做分群