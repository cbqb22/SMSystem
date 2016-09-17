USE SMSystem
GO


/*
   2016年7月13日17:15:51
   ユーザー: 
   サーバー: POOHACE-VAIO\SQL2012
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

IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'Shifts')
BEGIN


	BEGIN TRANSACTION

	ALTER TABLE dbo.Employees SET (LOCK_ESCALATION = TABLE)

	select Has_Perms_By_Name(N'dbo.Employees', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employees', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employees', 'Object', 'CONTROL') as Contr_Per

	CREATE TABLE dbo.Shifts
		(
		ID int NOT NULL IDENTITY (1, 1),
		EmployeeID int NOT NULL,
		削除フラグ bit NOT NULL
		)  ON [PRIMARY]

	ALTER TABLE dbo.Shifts ADD CONSTRAINT
		DF_Shifts_削除フラグ DEFAULT N'0' FOR 削除フラグ

	ALTER TABLE dbo.Shifts ADD CONSTRAINT
		PK_Shifts PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE dbo.Shifts ADD CONSTRAINT
		FK_Shifts_Employees1 FOREIGN KEY
		(
		EmployeeID
		) REFERENCES dbo.Employees
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 
	

	ALTER TABLE dbo.Shifts SET (LOCK_ESCALATION = TABLE)

	COMMIT
	select Has_Perms_By_Name(N'dbo.Shifts', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Shifts', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Shifts', 'Object', 'CONTROL') as Contr_Per 
END
