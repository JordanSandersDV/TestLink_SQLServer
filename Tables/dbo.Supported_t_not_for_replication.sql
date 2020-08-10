CREATE TABLE [dbo].[Supported_t_not_for_replication] (
  [id] [int] IDENTITY,
  [number] [decimal](18, 10) NULL,
  CONSTRAINT [uk_not_for_replication] UNIQUE CLUSTERED ([id])
)
GO