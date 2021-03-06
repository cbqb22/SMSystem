USE [SMSystem]
GO

--CNgðZbg
DBCC CHECKIDENT ([ShiftDetails] ,RESEED ,0)
DBCC CHECKIDENT ([DutyCategories] ,RESEED ,0)
--DBCC CHECKIDENT ([Shifts] ,RESEED ,0)
DBCC CHECKIDENT ([Shops] ,RESEED ,0)
DBCC CHECKIDENT ([ShopCategories] ,RESEED ,0)
DBCC CHECKIDENT ([Employees] ,RESEED ,0)
DBCC CHECKIDENT ([Territories] ,RESEED ,0)
DBCC CHECKIDENT ([Statuses] ,RESEED ,0)

DELETE FROM [dbo].[ShiftDetails]
DELETE FROM [dbo].[DutyCategories]
--DELETE FROM [dbo].[Shifts]
DELETE FROM [dbo].[Employees]
DELETE FROM [dbo].[Shops]
DELETE FROM [dbo].[ShopCategories]
DELETE FROM [dbo].[Territories]
DELETE FROM [dbo].[Statuses]
GO

--Statuses
INSERT INTO [dbo].[Statuses] ([ðE¼],[ítO]) VALUES('ÇòÜt',0)
INSERT INTO [dbo].[Statuses] ([ðE¼],[ítO]) VALUES('òÜt',0)
INSERT INTO [dbo].[Statuses] ([ðE¼],[ítO]) VALUES('²Ü±',0)
GO


--ShopCategories
INSERT INTO [dbo].[ShopCategories]([JeSíÊ],[õl]) VALUES('{','-')
INSERT INTO [dbo].[ShopCategories]([JeSíÊ],[õl]) VALUES('²ÜòÇ','-')
INSERT INTO [dbo].[ShopCategories]([JeSíÊ],[õl]) VALUES('hbOXgA','-')
GO


--Territories
INSERT INTO [dbo].[Territories]([GA¼],[õl],[ítO])VALUES('½æ','',0)
INSERT INTO [dbo].[Territories]([GA¼],[õl],[ítO])VALUES('{Oæ','',0)
INSERT INTO [dbo].[Territories]([GA¼],[õl],[ítO])VALUES('¶æ','',0)
INSERT INTO [dbo].[Territories]([GA¼],[õl],[ítO])VALUES('aJæ','',0)
INSERT INTO [dbo].[Territories]([GA¼],[õl],[ítO])VALUES('Vhæ','',0)
GO



--Shops
INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[XÜ¼],[cÆÔ_Êí],[cÆÔ_jú],[cÆÔ_»Ì¼],[cÆú],[I[vú],[ÂXú],[ítO])
     VALUES (1,1,'{Z^[','0900-2300','0000-0000','0000-0000','1-1-1-1-1-0-0','2010/04/01','2099/12/31',0)

INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[XÜ¼],[cÆÔ_Êí],[cÆÔ_jú],[cÆÔ_»Ì¼],[cÆú],[I[vú],[ÂXú],[ítO])
     VALUES (2,1,'oËX','0900-2300','0900-1800','0900-1800','1-1-1-1-1-1-1','2012/04/01','2099/12/31',0)

INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[XÜ¼],[cÆÔ_Êí],[cÆÔ_jú],[cÆÔ_»Ì¼],[cÆú],[I[vú],[ÂXú],[ítO])
     VALUES (2,1,'üuVX','0900-2300','0900-1800','0900-1800','1-1-1-1-1-1-1','2012/04/01','2099/12/31',0)

INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[XÜ¼],[cÆÔ_Êí],[cÆÔ_jú],[cÆÔ_»Ì¼],[cÆú],[I[vú],[ÂXú],[ítO])
     VALUES (2,1,'¤îcçwOX','0900-2300','0900-1800','0900-1800','1-1-1-1-1-1-1','2012/04/01','2099/12/31',0)
GO







--DutyCategories
INSERT INTO [dbo].[DutyCategories]([Æ±¼],[õl],[ítO]) VALUES('²Ü','-',0)
INSERT INTO [dbo].[DutyCategories]([Æ±¼],[õl],[ítO]) VALUES('OTC','-',0)
INSERT INTO [dbo].[DutyCategories]([Æ±¼],[õl],[ítO]) VALUES('²ÜOTC','-',0)
INSERT INTO [dbo].[DutyCategories]([Æ±¼],[õl],[ítO]) VALUES('Ðà¤C','-',0)
INSERT INTO [dbo].[DutyCategories]([Æ±¼],[õl],[ítO]) VALUES('ÐO¤C','-',0)
GO


--Employees
INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'Oã','ëj',0,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)


INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'Xc','»q',1,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'R','ê',0,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'¡R','Èá',0,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'åì','jq',1,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'Ã®','S½',0,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'¶','Fq',1,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(1,1,2,'{R','\á',0,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(3,1,2,'R','aÌq',1,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(3,1,2,'Vº','[',1,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[©],[¼],[«Ê],[¶Nú],[XÖÔ],[Z],[©îdbÔ],[gÑdbÔ],[E[AhX],[gÑ[AhX],[z[y[W],[õl]
           ,[o^ú],[OltO],[ítO])
     VALUES(3,1,2,'{é','¬}q',1,'1982/09/30','2140014','saJæ_{OÚ Ô¢','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)


GO



--e[uí
----Shifts
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (1 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (2 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (3 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (4 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (5 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (6 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (7 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (8 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (9 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (10 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[ítO]) VALUES (11 ,0)

--GO


/**ShiftID-1**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/01','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/02','1000','1900','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/05','1200','2100','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO

/**ShiftID-2**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/01','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/02','1000','2300','1400-1500','1900-2000','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/05','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO

/**ShiftID-3**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/01','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/02','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/05','0400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO

/**ShiftID-4**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/01','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/02','1000','1900','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/05','1200','2100','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO


/**ShiftID-5**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/01','1200','1600','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/02','1000','1400','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/04','0900','1300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/05','0900','1300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO


/**ShiftID-6**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/01','1900','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/02','1900','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/03','1900','2300','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/04','2000','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/05','2000','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO

/**ShiftID-7**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/01','1400','1800','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/02','1400','2300','1900-2000','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/03','1400','1800','','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/04','1400','1900','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/05','1400','2300','1900-2000','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO




--²Ü±
/**ShiftID-9**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/01','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/02','1000','1900','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/05','1200','2100','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO

/**ShiftID-10**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/01','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/02','1000','2300','1400-1500','1900-2000','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/05','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO

/**ShiftID-11**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/01','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/02','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/05','0400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[o^ú],[õl],[ítO])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO