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
	join stock_data on calendar.date = stock_data.date	-- JOIN股價資訊資料表，兩個資料表透過日期來產生關聯
	join stock_list on stock_list.stock_code = stock_data.stock_code	-- JOIN股票資訊資料表，兩個資料表透過股票代號來產生關聯
	where stock_data.d >= 1	-- 找尋符合漲跌價差 >= 1
	and year(calendar.date) = @year	-- ，且為@year年
	and month(calendar.date) = @month	-- @month月的資料
	group by stock_data.stock_code, stock_list.name	-- 藉由股票代號、公司名稱做分群
)
GO
