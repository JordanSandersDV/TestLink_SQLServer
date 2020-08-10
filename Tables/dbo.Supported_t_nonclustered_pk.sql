CREATE TABLE [dbo].[Supported_t_nonclustered_pk] (
  [id] [int] NOT NULL,
  [bin] [varbinary](255) NULL,
  CONSTRAINT [pk_nonclustered] PRIMARY KEY NONCLUSTERED ([id])
)
GO