USE SMSystem
GO


/*
   2016年7月13日17:15:51
   ユーザー: 
   サーバー: 
   データベース: SMSystem
   アプリケーション: 
*/

/* データ損失の問題を防ぐため、データベース デザイナーのコンテキスト外でこのスクリプトを実行する前に、スクリプトの詳細を確認してください。*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT

IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'ShiftDetails')
BEGIN
	BEGIN TRANSACTION


	ALTER TABLE dbo.ShopCategories SET (LOCK_ESCALATION = TABLE)

	select Has_Perms_By_Name(N'dbo.ShopCategories', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ShopCategories', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ShopCategories', 'Object', 'CONTROL') as Contr_Per 

	ALTER TABLE dbo.DutyCategories SET (LOCK_ESCALATION = TABLE)

	select Has_Perms_By_Name(N'dbo.DutyCategories', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.DutyCategories', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.DutyCategories', 'Object', 'CONTROL') as Contr_Per 

	CREATE TABLE dbo.ShiftDetails
		(
		ID int NOT NULL IDENTITY (1, 1),
		EmployeeID int NOT NULL,
		ShopID int NOT NULL,
		DutyCategoryID int NOT NULL,
		IsHoliday bit NOT NULL,
		WorkingDate datetime NOT NULL,
		StartTime nvarchar(4) NOT NULL,
		EndTime nvarchar(4)NOT NULL,
		Intermission1 nvarchar(9) NOT NULL,
		Intermission2 nvarchar(9) NOT NULL,
		TravelTime1 nvarchar(9) NOT NULL,
		TravelTime2 nvarchar(9) NOT NULL,
		IsHelpStaff bit NOT NULL,
		登録日時 datetime NOT NULL,
		備考 nvarchar(MAX) NOT NULL,
		削除フラグ bit NOT NULL
		)  ON [PRIMARY]
		 TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		DF_ShiftDetails_IsHelpStaff DEFAULT N'0' FOR IsHelpStaff

	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		DF_ShiftDetails_IsHoliday DEFAULT N'0' FOR IsHoliday

	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		DF_ShiftDetails_備考 DEFAULT N'-' FOR 備考

	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		DF_ShiftDetails_削除フラグ DEFAULT N'0' FOR 削除フラグ

	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		PK_ShiftDetails PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		FK_ShiftDetails_DutyCategories1 FOREIGN KEY
		(
		DutyCategoryID
		) REFERENCES dbo.DutyCategories
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 
	
		ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		FK_ShiftDetails_Employees FOREIGN KEY
		(
		EmployeeID
		) REFERENCES dbo.Employees
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 


	ALTER TABLE dbo.ShiftDetails ADD CONSTRAINT
		FK_ShiftDetails_Shop FOREIGN KEY
		(
		ShopID
		) REFERENCES dbo.Shops
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 
	
	

	ALTER TABLE dbo.ShiftDetails SET (LOCK_ESCALATION = TABLE)

	COMMIT
	select Has_Perms_By_Name(N'dbo.ShiftDetails', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ShiftDetails', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ShiftDetails', 'Object', 'CONTROL') as Contr_Per 

END