CREATE TABLE [dbo].[Supported_t_rowguidcol] (
  [id] [int] NULL,
  [row_guid] [uniqueidentifier] NOT NULL,
  CONSTRAINT [uk_rowguidcol] UNIQUE CLUSTERED ([id])
)
GO