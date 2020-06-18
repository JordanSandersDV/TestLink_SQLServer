SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE Procedure [dbo].[USP_Pardot_Open_Clicks_Updation] 

as

begin



------BEGIN TRY

------BEGIN TRAN


--------Fetching Pardot Open & Clicks 
/*
IF OBJECT_ID('tempdb.dbo.#Pardot', 'U') IS NOT NULL
  DROP TABLE #Pardot;

select
       Issuer = case 
                                  when e.[name] like '%Olden Lane%' then 'Olden Lane'
                                  when e.[name] like '%BARC%' then 'Barclays'
                                  when e.[name] like '%BMO%' then 'Bank of Montreal'
                                  when e.[name] like '%CS%' then 'Credit Suisse'
                                  when e.[name] like '%GS%' then 'Goldman sachs'
                                  when e.[name] like '%JPM%' then 'JP Morgan'
								  when e.[name] like '%AM - OShares%' Then 'Oshare'
                                  else null
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
	   into #Pardot
from Pardot.VisitorActivity va
inner join Pardot.Prospect ps
ON va.Prospect_ID = ps.Id
inner join Pardot.Email e
ON (va.Email_ID = e.ID or va.List_Email_ID = e.ID )
where va.type in (1, 11)
group by case 
                                  when e.[name] like '%Olden Lane%' then 'Olden Lane'
                                  when e.[name] like '%BARC%' then 'Barclays'
                                  when e.[name] like '%BMO%' then 'Bank of Montreal'
                                  when e.[name] like '%CS%' then 'Credit Suisse'
                                  when e.[name] like '%GS%' then 'Goldman sachs'
                                  when e.[name] like '%JPM%' then 'JP Morgan'
								  when e.[name] like '%AM - OShares%' Then 'Oshare'
                                  else null
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

IF OBJECT_ID('tempdb.dbo.#Partdot_OpenClick', 'U') IS NOT NULL
  DROP TABLE #Partdot_OpenClick;


select * into #Partdot_OpenClick From #Pardot
where [Issuer] is not null and Month_Year is not null

Truncate table  Pardot_Open_Clicks

Insert into Pardot_Open_Clicks (Issuer,	Month_Year,[name],crm_contact_fid,Ops,Open_Clikcs_count,Latest_Event_Date)

Select Issuer,	Month_Year,[name],crm_contact_fid,Ops,Open_Clikcs_count,Latest_Event_Date From #Partdot_OpenClick;

*/

----Declaring Current_month
Declare @Current_Month as Varchar(30);
set @Current_Month=DateName(month,Getdate() ) +'_'+Cast(Year(Getdate())as Varchar(30));
--select @Current_Month

		
----Declaring Prior_month
Declare @Prior_Month as Varchar(30);
set @Prior_Month=DateName(Month,DateAdd(mm,-1,Getdate())) +'_'+Cast(YEAR(DateAdd(mm,-1,Getdate())) as Varchar(30));
--select @Prior_Month

----Declaring Prior_TWO_Month
Declare @Prior_TWO_Month as Varchar(30);
set @Prior_TWO_Month=DateName(Month,DateAdd(mm,-2,Getdate())) +'_'+Cast(YEAR(DateAdd(mm,-1,Getdate())) as Varchar(30));
--select @Prior_TWO_Month;


-- Truncate Existing Pardot_Open_Clicks
--Truncate Table dbo.Pardot_Open_Clicks;




--New Format wtih CTE Combining All Issuer and Business Lines

With Pardot As
(
	select
		   Issuer = case	
									  when e.[Name] like '%Barclays ETN%' then 'Barclays ETN'
									  when e.[name] like 'SP - BARC%' then 'Barclays'
									  when e.[name] like 'SP - BMO%' then 'Bank of Montreal'
									  when e.[name] like 'SP - CS%' then 'Credit Suisse'
									  when e.[name] like 'SP - GS%' And e.[name] not like '%GSAM%' then 'Goldman sachs'
									  when e.[name] like 'SP - JPM%' then 'JP Morgan'
									  when e.[Name] like 'CM - AXIO%' then 'CapitalMarkets'
									  when e.[Name] like 'SP - BNP%' then 'BNP Paribas'
									  when e.[Name] like '%SP - AXIO - RIA%' then 'RIA'
									  when e.[Name] like '%SP - AXIO - LPL%' Or 
                                           e.[Name] like '%SP - AXIO - Cetera%' Or 
                                           e.[Name]  like '%SP - AXIO - American Portfolios%' Or
                                           e.[Name] like '%SP - AXIO - Aegis Capital%' Or
                                           e.[Name] like '%SP - AXIO - Baird%' Or
										   e.[Name] like '%SP - AXIO - AXA%' Then 'AXIO'
									  else null
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
	from Pardot.VisitorActivity va
	inner join Pardot.Prospect ps
	ON va.Prospect_ID = ps.Id
	inner join Pardot.Email e
	ON (va.Email_ID = e.ID or va.List_Email_ID = e.ID )
	where va.type in (1, 11)
	group by case 
									  when e.[Name] like '%Barclays ETN%' then 'Barclays ETN'
									  when e.[name] like 'SP - BARC%' then 'Barclays'
									  when e.[name] like 'SP - BMO%' then 'Bank of Montreal'
									  when e.[name] like 'SP - CS%' then 'Credit Suisse'
									  when e.[name] like 'SP - GS%' And e.[name] not like '%GSAM%' then 'Goldman sachs'
									  when e.[name] like 'SP - JPM%' then 'JP Morgan'
									  when e.[Name] like 'CM - AXIO%' then 'CapitalMarkets'
									  when e.[Name] like 'SP - BNP%' then 'BNP Paribas'
									  when e.[Name] like '%SP - AXIO - RIA%' then 'RIA'
									  when e.[Name] like '%SP - AXIO - LPL%' Or 
                                           e.[Name] like '%SP - AXIO - Cetera%' Or 
                                           e.[Name]  like '%SP - AXIO - American Portfolios%' Or
                                           e.[Name] like '%SP - AXIO - Aegis Capital%' Or
                                           e.[Name] like '%SP - AXIO - Baird%' Or
										   e.[Name] like '%SP - AXIO - AXA%' Then 'AXIO'
									  else null
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
)
Insert into dbo.Pardot_Open_Clicks (Issuer,	Month_Year,[name],crm_contact_fid,Ops,Open_Clikcs_count,Latest_Event_Date, SFDC_Field_API_Name)
Select Issuer,	Month_Year,[name],crm_contact_fid,Ops,Open_Clikcs_count,Latest_Event_Date,
	SFDC_Field_API_Name = 
		(
			Case
				-- Opens for Current Month
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='Barclays' Then Ops + '_Current_Month_BARC__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='Bank of Montreal' Then Ops + '_Current_Month_BMO__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='Credit Suisse' Then Ops + '_Current_Month_CS__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='Goldman sachs' Then Ops + '_Current_Month_GS__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='JP Morgan' Then Ops + '_Current_Month_JPM__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='CapitalMarkets' Then Ops + '_Current_Month_Capital_Markets__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='BNP Paribas' Then Ops + '_Current_Month_BNP__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='Barclays ETN' Then Ops + '_Current_Month_Barc_ETN__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='RIA' Then Ops + '_Current_Month_RIA__c'
				When Ops = 'Open' And Month_Year=@Current_Month And  Issuer='AXIO' Then Ops + '_Current_Month_AXIO__c'
				-- Opens for Prior Month
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='Barclays' Then Ops + '_Prior_Month_BARC__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='Bank of Montreal' Then Ops + '_Prior_Month_BMO__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='Credit Suisse' Then Ops + '_Prior_Month_CS__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='Goldman sachs' Then Ops + '_Prior_Month_GS__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='JP Morgan' Then Ops + '_Prior_Month_JPM__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='CapitalMarkets' Then Ops + '_Prior_Month_Capital_Markets__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='BNP Paribas' Then Ops + '_Prior_Month_BNP__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='Barclays ETN' Then Ops + '_Prior_Month_Barc_ETN__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='RIA' Then Ops + '_Prior_Month_RIA__c'
				When Ops = 'Open' And Month_Year=@Prior_Month And  Issuer='AXIO' Then Ops + '_Prior_Month_AXIO__c'
				-- Opens for Prior 2 Months
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='Barclays' Then Ops + '_Two_Months_Prior_BARC__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='Bank of Montreal' Then Ops + '_Two_Months_Prior_BMO__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='Credit Suisse' Then Ops + '_Two_Months_Prior_CS__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='Goldman sachs' Then Ops + '_Two_Months_Prior_GS__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='JP Morgan' Then Ops + '_Two_Months_Prior_JPM__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='CapitalMarkets' Then Ops + '_Two_Months_Prior_Capital_Markets__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='BNP Paribas' Then Ops + '_Two_Months_Prior_BNP__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='Barclays ETN' Then Ops + '_Two_Months_Prior_Barc_ETN__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='RIA' Then Ops + '_Two_Months_Prior_RIA__c'
				When Ops = 'Open' And Month_Year=@Prior_TWO_Month And  Issuer='AXIO' Then Ops + '_Two_Months_Prior_AXIO__c'
				-- Clicks for Current Month
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='Barclays' Then Ops + '_Current_Month_BARC__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='Bank of Montreal' Then Ops + '_Current_Month_BMO__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='Credit Suisse' Then Ops + '_Current_Month_CS__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='Goldman sachs' Then Ops + '_Current_Month_GS__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='JP Morgan' Then Ops + '_Current_Month_JPM__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='CapitalMarkets' Then Ops + '_Current_Month_Capital_Markets__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='BNP Paribas' Then Ops + '_Current_Month_BNP__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='Barclays ETN' Then Ops + '_Current_Month_Barc_ETN__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='RIA' Then Ops + '_Current_Month_RIA__c'
				When Ops = 'Click' And Month_Year=@Current_Month And  Issuer='AXIO' Then Ops + '_Current_Month_AXIO__c'
				-- Clicks for Prior Month
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='Barclays' Then Ops + '_Prior_Month_BARC__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='Bank of Montreal' Then Ops + '_Prior_Month_BMO__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='Credit Suisse' Then Ops + '_Prior_Month_CS__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='Goldman sachs' Then Ops + '_Prior_Month_GS__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='JP Morgan' Then Ops + '_Prior_Month_JPM__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='CapitalMarkets' Then Ops + '_Prior_Month_Capital_Markets__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='BNP Paribas' Then Ops + '_Prior_Month_BNP__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='Barclays ETN' Then Ops + '_Prior_Month_Barc_ETN__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='RIA' Then Ops + '_Prior_Month_RIA__c'
				When Ops = 'Click' And Month_Year=@Prior_Month And  Issuer='AXIO' Then Ops + '_Prior_Month_AXIO__c'
				-- Clicks for Prior 2 Months
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='Barclays' Then Ops + '_Two_Months_Prior_BARC__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='Bank of Montreal' Then Ops + '_Two_Months_Prior_BMO__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='Credit Suisse' Then Ops + '_Two_Months_Prior_CS__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='Goldman sachs' Then Ops + '_Two_Months_Prior_GS__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='JP Morgan' Then Ops + '_Two_Months_Prior_JPM__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='CapitalMarkets' Then Ops + '_Two_Months_Prior_Capital_Markets__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='BNP Paribas' Then Ops + '_Two_Months_Prior_BNP__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='Barclays ETN' Then Ops + '_Two_Months_Prior_Barc_ETN__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='RIA' Then Ops + '_Two_Months_Prior_RIA__c'
				When Ops = 'Click' And Month_Year=@Prior_TWO_Month And  Issuer='AXIO' Then Ops + '_Two_Months_Prior_AXIO__c'
			End
		)
From Pardot Where [Issuer] is not null and Month_Year is not null;


Update Statistics dbo.Pardot_Open_Clicks;


---------Capital Markets Pardot Opens & Clicks Updations ---

--Exec [dbo].[USP_Capital_Markets_Pardot_Open_Clicks_Updation] 



end
GO