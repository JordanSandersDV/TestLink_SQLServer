CREATE TABLE [dbo].[Supported_t_check_not_for_replication] (
  [id] [int] NOT NULL,
  [number] [decimal](18, 9) NULL,
  CONSTRAINT [pk_check_not_for_replication] PRIMARY KEY CLUSTERED ([id])
)
GO

ALTER TABLE [dbo].[Supported_t_check_not_for_replication] WITH NOCHECK
  ADD CONSTRAINT [check_number] CHECK ([number]>(0))
GO