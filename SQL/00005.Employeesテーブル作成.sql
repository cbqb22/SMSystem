USE SMSystem
GO

/*
   2016年7月13日16:26:27
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

IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'Employees')
BEGIN

	BEGIN TRANSACTION


	ALTER TABLE dbo.Territories SET (LOCK_ESCALATION = TABLE)

	ALTER TABLE dbo.Statuses SET (LOCK_ESCALATION = TABLE)


	CREATE TABLE dbo.Employees
		(
		ID int NOT NULL IDENTITY (1, 1),
		StatusID int NOT NULL,
		TerritoryID int NOT NULL,
		ShopID int NOT NULL,
		姓 nvarchar(100) NOT NULL,
		名 nvarchar(100) NOT NULL,
		性別 bit NOT NULL,
		生年月日 datetime NOT NULL,
		郵便番号 nvarchar(20) NOT NULL,
		住所 nvarchar(MAX) NOT NULL,
		自宅電話番号 nvarchar(20) NOT NULL,
		携帯電話番号 nvarchar(20) NOT NULL,
		Eメールアドレス nvarchar(254) NOT NULL,
		携帯メールアドレス nvarchar(254) NOT NULL,
		ホームページ nvarchar(MAX) NOT NULL,
		備考 nvarchar(MAX) NOT NULL,
		登録日時 datetime NOT NULL,
		外国人フラグ bit NOT NULL,
		削除フラグ bit NOT NULL
		)  ON [PRIMARY]
		 TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_郵便番号 DEFAULT N'-' FOR 郵便番号

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_住所 DEFAULT N'-' FOR 住所

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_自宅電話番号 DEFAULT N'-' FOR 自宅電話番号

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_携帯電話番号 DEFAULT N'-' FOR 携帯電話番号

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_Eメールアドレス DEFAULT N'-' FOR Eメールアドレス

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_携帯メールアドレス DEFAULT N'-' FOR 携帯メールアドレス

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_ホームページ DEFAULT N'-' FOR ホームページ

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_備考 DEFAULT N'-' FOR 備考

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_外国人フラグ DEFAULT 0 FOR 外国人フラグ

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		DF_Employees_削除フラグ DEFAULT 0 FOR 削除フラグ

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		PK_Employees PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	ALTER TABLE dbo.Employees ADD CONSTRAINT
		FK_Employees_Territories FOREIGN KEY
		(
		TerritoryID
		) REFERENCES dbo.Territories
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 

	ALTER TABLE dbo.Employees ADD CONSTRAINT
	FK_Employees_Shops FOREIGN KEY
	(
	ShopID
	) REFERENCES dbo.Shops
	(
	ID
	) ON UPDATE  NO ACTION 
		ON DELETE  NO ACTION 

	

	ALTER TABLE dbo.Employees ADD CONSTRAINT
		FK_Employees_Statuses FOREIGN KEY
		(
		StatusID
		) REFERENCES dbo.Statuses
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 
	

	ALTER TABLE dbo.Employees SET (LOCK_ESCALATION = TABLE)

	COMMIT
	select Has_Perms_By_Name(N'dbo.Employees', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employees', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employees', 'Object', 'CONTROL') as Contr_Per 

END