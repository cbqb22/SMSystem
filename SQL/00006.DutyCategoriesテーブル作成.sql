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

IF NOT EXISTS(SELECT name,type FROM sysobjects WHERE type = 'U' AND name = 'DutyCategories')
BEGIN

	BEGIN TRANSACTION

	CREATE TABLE dbo.DutyCategories
		(
		ID int NOT NULL IDENTITY (1, 1),
		業務名 nvarchar(MAX) NOT NULL,
		備考 nvarchar(MAX) NOT NULL,
		削除フラグ bit NOT NULL
		)  ON [PRIMARY]
		 TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE dbo.DutyCategories ADD CONSTRAINT
		DF_DutyCategories_備考 DEFAULT N'-' FOR 備考

	ALTER TABLE dbo.DutyCategories ADD CONSTRAINT
		DF_DutyCategories_削除フラグ DEFAULT N'0' FOR 削除フラグ

	ALTER TABLE dbo.DutyCategories ADD CONSTRAINT
		PK_DutyCategories PRIMARY KEY CLUSTERED 
		(
		ID
		) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	ALTER TABLE dbo.DutyCategories SET (LOCK_ESCALATION = TABLE)

	COMMIT
	select Has_Perms_By_Name(N'dbo.DutyCategories', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.DutyCategories', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.DutyCategories', 'Object', 'CONTROL') as Contr_Per 

END