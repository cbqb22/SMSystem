USE [SMSystem]
GO

--インクリメントをリセット
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
INSERT INTO [dbo].[Statuses] ([役職名],[削除フラグ]) VALUES('管理薬剤師',0)
INSERT INTO [dbo].[Statuses] ([役職名],[削除フラグ]) VALUES('薬剤師',0)
INSERT INTO [dbo].[Statuses] ([役職名],[削除フラグ]) VALUES('調剤事務',0)
GO


--ShopCategories
INSERT INTO [dbo].[ShopCategories]([カテゴリ種別],[備考]) VALUES('本部','-')
INSERT INTO [dbo].[ShopCategories]([カテゴリ種別],[備考]) VALUES('調剤薬局','-')
INSERT INTO [dbo].[ShopCategories]([カテゴリ種別],[備考]) VALUES('ドラッグストア','-')
GO


--Territories
INSERT INTO [dbo].[Territories]([エリア名],[備考],[削除フラグ])VALUES('多摩区','',0)
INSERT INTO [dbo].[Territories]([エリア名],[備考],[削除フラグ])VALUES('宮前区','',0)
INSERT INTO [dbo].[Territories]([エリア名],[備考],[削除フラグ])VALUES('麻生区','',0)
INSERT INTO [dbo].[Territories]([エリア名],[備考],[削除フラグ])VALUES('渋谷区','',0)
INSERT INTO [dbo].[Territories]([エリア名],[備考],[削除フラグ])VALUES('新宿区','',0)
GO



--Shops
INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[店舗名],[営業時間_通常],[営業時間_祝日],[営業時間_その他],[営業日],[オープン日時],[閉店日時],[削除フラグ])
     VALUES (1,1,'本部センター','0900-2300','0000-0000','0000-0000','1-1-1-1-1-0-0','2010/04/01','2099/12/31',0)

INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[店舗名],[営業時間_通常],[営業時間_祝日],[営業時間_その他],[営業日],[オープン日時],[閉店日時],[削除フラグ])
     VALUES (2,1,'登戸店','0900-2300','0900-1800','0900-1800','1-1-1-1-1-1-1','2012/04/01','2099/12/31',0)

INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[店舗名],[営業時間_通常],[営業時間_祝日],[営業時間_その他],[営業日],[オープン日時],[閉店日時],[削除フラグ])
     VALUES (2,1,'向ヶ丘遊園店','0900-2300','0900-1800','0900-1800','1-1-1-1-1-1-1','2012/04/01','2099/12/31',0)

INSERT INTO [dbo].[Shops]([ShopCategoryID],[TerritoryID],[店舗名],[営業時間_通常],[営業時間_祝日],[営業時間_その他],[営業日],[オープン日時],[閉店日時],[削除フラグ])
     VALUES (2,1,'京王稲田堤駅前店','0900-2300','0900-1800','0900-1800','1-1-1-1-1-1-1','2012/04/01','2099/12/31',0)
GO







--DutyCategories
INSERT INTO [dbo].[DutyCategories]([業務名],[備考],[削除フラグ]) VALUES('調剤','-',0)
INSERT INTO [dbo].[DutyCategories]([業務名],[備考],[削除フラグ]) VALUES('OTC','-',0)
INSERT INTO [dbo].[DutyCategories]([業務名],[備考],[削除フラグ]) VALUES('調剤＆OTC','-',0)
INSERT INTO [dbo].[DutyCategories]([業務名],[備考],[削除フラグ]) VALUES('社内研修','-',0)
INSERT INTO [dbo].[DutyCategories]([業務名],[備考],[削除フラグ]) VALUES('社外研修','-',0)
GO


--Employees
INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'三上','雅史',0,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)


INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'森田','綾子',1,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'中山','純一',0,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'藤山','省吾',0,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'大野','桂子',1,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'古屋','鉄平',0,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'霧島','孝子',1,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(1,1,2,'本山','圭吾',0,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(3,1,2,'杉山','和歌子',1,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(3,1,2,'新村','啓',1,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)

INSERT INTO [dbo].[Employees]([StatusID],[TerritoryID],[ShopID],[姓],[名],[性別],[生年月日],[郵便番号],[住所],[自宅電話番号],[携帯電話番号],[Eメールアドレス],[携帯メールアドレス],[ホームページ],[備考]
           ,[登録日時],[外国人フラグ],[削除フラグ])
     VALUES(3,1,2,'本城','小枝子',1,'1982/09/30','2140014','東京都渋谷区神宮前○丁目□番△号','031234XXXX','0901234XXXX','xxxxxxx@yyyyy.zzz','aaaaaaa@bbbbb.ccc','-','',GETDATE(),0,0)


GO



--テーブル削除
----Shifts
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (1 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (2 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (3 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (4 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (5 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (6 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (7 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (8 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (9 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (10 ,0)
--INSERT INTO [dbo].[Shifts]([EmployeeID],[削除フラグ]) VALUES (11 ,0)

--GO


/**ShiftID-1**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/01','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/02','1000','1900','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        0,'2016/08/05','1200','2100','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 1,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO

/**ShiftID-2**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/01','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/02','1000','2300','1400-1500','1900-2000','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        0,'2016/08/05','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 2,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO

/**ShiftID-3**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/01','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/02','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        0,'2016/08/05','0400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 3,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO

/**ShiftID-4**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/01','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/02','1000','1900','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        0,'2016/08/05','1200','2100','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 4,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO


/**ShiftID-5**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/01','1200','1600','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/02','1000','1400','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/04','0900','1300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        0,'2016/08/05','0900','1300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 5,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO


/**ShiftID-6**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/01','1900','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/02','1900','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/03','1900','2300','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/04','2000','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        0,'2016/08/05','2000','2300','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 6,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO

/**ShiftID-7**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/01','1400','1800','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/02','1400','2300','1900-2000','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/03','1400','1800','','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/04','1400','1900','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        0,'2016/08/05','1400','2300','1900-2000','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 7,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO




--調剤事務
/**ShiftID-9**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/01','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/02','1000','1900','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/03','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        0,'2016/08/05','1200','2100','1500-1600','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 9,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)

GO

/**ShiftID-10**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/01','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/02','1000','2300','1400-1500','1900-2000','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        0,'2016/08/05','0900','1800','1300-1400','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 10,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO

/**ShiftID-11**/
INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/01','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/02','1200','2100','1600-1700','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/03','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/04','1400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        0,'2016/08/05','0400','2300','1700-1800','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        1,'2016/08/06','-','-','-','-','-','-',0,'2015/04/01','-',0)

INSERT INTO [dbo].[ShiftDetails]([EmployeeID],[ShopID],[DutyCategoryID],[IsHoliday],[WorkingDate],[StartTime],[EndTime],[Intermission1],[Intermission2],[TravelTime1],[TravelTime2],[IsHelpStaff],[登録日時],[備考],[削除フラグ])
--           ID   Shop DutyCate  IsHoliday  
	 VALUES ( 11,   2,  1,        1,'2016/08/07','-','-','-','-','-','-',0,'2015/04/01','-',0)


GO