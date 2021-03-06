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

--テーブル'U'
--ストアド'FN'
--外部キー'F'
--主キー'K'
--既定値'D'
IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'Statuses')
BEGIN
	BEGIN TRANSACTION

	CREATE TABLE dbo.Statuses
		(
		ID int NOT NULL IDENTITY (1, 1),
		役職名 nvarchar(255) NOT NULL,
		削除フラグ bit NOT NULL
		)  ON [PRIMARY]
	ALTER TABLE dbo.Statuses ADD CONSTRAINT
		DF_Statuses_削除フラグ DEFAULT 0 FOR 削除フラグ
	ALTER TABLE dbo.Statuses ADD CONSTRAINT
		PK_Statuses PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	ALTER TABLE dbo.Statuses SET (LOCK_ESCALATION = TABLE)
	COMMIT
	select Has_Perms_By_Name(N'dbo.Statuses', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Statuses', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Statuses', 'Object', 'CONTROL') as Contr_Per 


END
