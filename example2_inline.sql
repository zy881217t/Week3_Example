-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION find_d_inline
(	
	-- Add the parameters for the function here
	@year varchar(4),
	@month varchar(2)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	select stock_data.stock_code, stock_list.name, count(*) days
	from calendar
	join stock_data on calendar.date = stock_data.date	-- JOIN�ѻ���T��ƪ�A��Ӹ�ƪ�z�L����Ӳ������p
	join stock_list on stock_list.stock_code = stock_data.stock_code	-- JOIN�Ѳ���T��ƪ�A��Ӹ�ƪ�z�L�Ѳ��N���Ӳ������p
	where stock_data.d >= 1	-- ��M�ŦX���^���t >= 1
	and year(calendar.date) = @year	-- �A�B��@year�~
	and month(calendar.date) = @month	-- @month�몺���
	group by stock_data.stock_code, stock_list.name	-- �ǥѪѲ��N���B���q�W�ٰ����s
)
GO
