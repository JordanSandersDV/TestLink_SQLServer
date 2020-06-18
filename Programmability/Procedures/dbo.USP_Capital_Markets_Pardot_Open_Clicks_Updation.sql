SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE Procedure [dbo].[USP_Capital_Markets_Pardot_Open_Clicks_Updation] 

as

begin



------BEGIN TRY

------BEGIN TRAN


--------Fetching Pardot Open & Clicks 

IF OBJECT_ID('tempdb.dbo.#CapitalMarkets_Open_Clicks', 'U') IS NOT NULL
  DROP TABLE #CapitalMarkets_Open_Clicks;

select
       Issuer = case 
                                  When E.[Name] like '%CM - AXIO %' then 'CapitalMarkets'
                           end,
       Month_Year = case 
                                                when e.[name] like '%' + DATENAME(month, getdate()) + '%' + DATENAME(YEAR, getdate()) + '%' then
                                                       DATENAME(month, getdate()) + '_' + DATENAME(Year, getdate())
                                                when e.[name] like '%' + DATENAME(month, dateadd(MM, -1, getdate())) + '%' + 
                                                       DATENAME(Year, dateadd(MM, -1, getdate())) + '%' then
                                                       DATENAME(month, dateadd(MM, -1, getdate())) + '_' + DATENAME(Year, dateadd(MM, -1, getdate()))
                                                when e.[name] like '%' + DATENAME(month, dateadd(MM, -2, getdate())) + '%' + 
                                                       DATENAME(Year, dateadd(MM, -2, getdate())) + '%' then
                                                       DATENAME(month, dateadd(MM, -2, getdate())) + '_' + DATENAME(Year, dateadd(MM, -2, getdate()))
                                         end,
       e.[name], ps.crm_contact_fid, Ops = IIF([type] = N'1', 'Click', 'Open'),
       Open_Clikcs_count = count(*),
       Latest_Event_Date = max(va.Created_At) 
	  into #CapitalMarkets_Open_Clicks
from Pardot.VisitorActivity va
inner join Pardot.Prospect ps
ON va.Prospect_ID = ps.Id
inner join Pardot.Email e
ON (va.Email_ID = e.ID or va.List_Email_ID = e.ID )
where va.type in (1, 11)
group by case 
                                  when E.[Name] like '%CM - AXIO %' then 'CapitalMarkets'
                           end, 
                            case 
                                  when e.[name] like '%' + DATENAME(month, getdate()) + '%' + DATENAME(YEAR, getdate()) + '%' then
                                         DATENAME(month, getdate()) + '_' + DATENAME(Year, getdate())
                                  when e.[name] like '%' + DATENAME(month, dateadd(MM, -1, getdate())) + '%' + 
                                         DATENAME(Year, dateadd(MM, -1, getdate())) + '%' then
                                         DATENAME(month, dateadd(MM, -1, getdate())) + '_' + DATENAME(Year, dateadd(MM, -1, getdate()))
                                  when e.[name] like '%' + DATENAME(month, dateadd(MM, -2, getdate())) + '%' + 
                                         DATENAME(Year, dateadd(MM, -2, getdate())) + '%' then
                                         DATENAME(month, dateadd(MM, -2, getdate())) + '_' + DATENAME(Year, dateadd(MM, -2, getdate()))
                                  end,
                           IIF([type] = N'1', 'Click', 'Open'),  e.[Name], ps.crm_contact_fid
order by 1, 2;




-----------
-------------  Loading into Temparory Table---

IF OBJECT_ID('tempdb.dbo.#CapitalMarkets_OpenClick', 'U') IS NOT NULL
  DROP TABLE #CapitalMarkets_OpenClick;



select * into #CapitalMarkets_OpenClick From #CapitalMarkets_Open_Clicks
where [Issuer] is not null and Month_Year is not null

Truncate table  Capital_Markets_Pardot_Open_Clicks

Insert into Capital_Markets_Pardot_Open_Clicks (Issuer,	Month_Year,[name],crm_contact_fid,Ops,Open_Clikcs_count,Latest_Event_Date)

Select Issuer,	Month_Year,[name],crm_contact_fid,Ops,Open_Clikcs_count,Latest_Event_Date From #CapitalMarkets_OpenClick







end
GO