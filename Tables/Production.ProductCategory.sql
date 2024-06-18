CREATE TABLE [Production].[ProductCategory] (
  [ProductCategoryID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductCategory_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED ([ProductCategoryID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_ProductCategory_Name]
  ON [Production].[ProductCategory] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_ProductCategory_rowguid]
  ON [Production].[ProductCategory] ([rowguid])
  ON [PRIMARY]
GO