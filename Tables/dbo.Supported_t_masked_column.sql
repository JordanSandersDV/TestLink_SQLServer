CREATE TABLE [dbo].[Supported_t_masked_column] (
  [pk] [int] IDENTITY,
  [FirstName] [varchar](100) NULL,
  [LastName] [varchar](100) NOT NULL,
  [Phone#] [varchar](12) NULL,
  [Email] [varchar](100) NULL,
  CONSTRAINT [pk_masked_colum] PRIMARY KEY CLUSTERED ([pk])
)
GO