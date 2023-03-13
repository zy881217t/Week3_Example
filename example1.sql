select stock_data.stock_code, stock_list.name, count(*) days
from calendar
join stock_data on calendar.date = stock_data.date	-- JOIN�ѻ���T��ƪ�A��Ӹ�ƪ�z�L����Ӳ������p
join stock_list on stock_list.stock_code = stock_data.stock_code	-- JOIN�Ѳ���T��ƪ�A��Ӹ�ƪ�z�L�Ѳ��N���Ӳ������p
where stock_data.d >= 1	-- ��M�ŦX���^���t >= 1
and year(calendar.date) = 2023	-- �A�B�����~
and month(calendar.date) = 3	-- 3�몺���
group by stock_data.stock_code, stock_list.name	-- �ǥѪѲ��N���B���q�W�ٰ����s