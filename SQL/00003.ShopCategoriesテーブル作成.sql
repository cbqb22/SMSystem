USE SMSystem
GO

/*
   2016年7月13日16:10:59
   ユーザー: 
   サーバー: 
   データベース: 
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

IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'ShopCategories')
BEGIN

	BEGIN TRANSACTION

	CREATE TABLE dbo.ShopCategories
		(
		ID int NOT NULL IDENTITY (1, 1),
		カテゴリ種別 nvarchar(100) NOT NULL,
		備考 nvarchar(MAX) NOT NULL
		)  ON [PRIMARY]
		 TEXTIMAGE_ON [PRIMARY]
	ALTER TABLE dbo.ShopCategories ADD CONSTRAINT
		DF_ShopCategories_備考 DEFAULT N'-' FOR 備考

	ALTER TABLE dbo.ShopCategories ADD CONSTRAINT
		PK_ShopCategories PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE dbo.ShopCategories SET (LOCK_ESCALATION = TABLE)

	COMMIT
	select Has_Perms_By_Name(N'dbo.ShopCategories', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ShopCategories', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ShopCategories', 'Object', 'CONTROL') as Contr_Per 
END