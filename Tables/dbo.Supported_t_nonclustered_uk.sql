CREATE TABLE [dbo].[Supported_t_nonclustered_uk] (
  [id] [int] NULL,
  [bin] [varbinary](255) NULL,
  CONSTRAINT [uk_nonclustered] UNIQUE ([id])
)
GO