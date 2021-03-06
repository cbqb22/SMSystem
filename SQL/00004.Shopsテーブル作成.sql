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

IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'Shops')
BEGIN


	BEGIN TRANSACTION

	ALTER TABLE dbo.Territories SET (LOCK_ESCALATION = TABLE)

	ALTER TABLE dbo.ShopCategories SET (LOCK_ESCALATION = TABLE)


	CREATE TABLE dbo.Shops
		(
		ID int NOT NULL IDENTITY (1, 1),
		ShopCategoryID int NOT NULL,
		TerritoryID int NOT NULL,
		店舗名 nvarchar(255) NOT NULL,
		営業時間_通常 nvarchar(9) NOT NULL,
		営業時間_祝日 nvarchar(9) NOT NULL,
		営業時間_その他 nvarchar(9) NOT NULL,
		営業日 nvarchar(15) NOT NULL,
		オープン日時 datetime NOT NULL,
		閉店日時 datetime NOT NULL,
		削除フラグ bit NOT NULL
		)  ON [PRIMARY]

	ALTER TABLE dbo.Shops ADD CONSTRAINT
		DF_Table_1_日曜営業フラグ DEFAULT 1-1-1-1-1-1-1+1 FOR 営業日

	ALTER TABLE dbo.Shops ADD CONSTRAINT
		DF_Shops_削除フラグ DEFAULT 0 FOR 削除フラグ

	ALTER TABLE dbo.Shops ADD CONSTRAINT
		PK_Shops PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	ALTER TABLE dbo.Shops ADD CONSTRAINT
		FK_Shops_ShopCategories FOREIGN KEY
		(
		ShopCategoryID
		) REFERENCES dbo.ShopCategories
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 
	

	ALTER TABLE dbo.Shops ADD CONSTRAINT
		FK_Shops_Territories1 FOREIGN KEY
		(
		TerritoryID
		) REFERENCES dbo.Territories
		(
		ID
		) ON UPDATE  NO ACTION 
		 ON DELETE  NO ACTION 
	

	ALTER TABLE dbo.Shops SET (LOCK_ESCALATION = TABLE)

	COMMIT
	select Has_Perms_By_Name(N'dbo.Shops', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Shops', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Shops', 'Object', 'CONTROL') as Contr_Per 

END