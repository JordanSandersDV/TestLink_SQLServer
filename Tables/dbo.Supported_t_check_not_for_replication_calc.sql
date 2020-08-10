SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Supported_t_check_not_for_replication_calc] (
  [id] [int] NOT NULL,
  [number] AS (CONVERT([decimal](18,9),[id])) PERSISTED,
  CONSTRAINT [pk_check_not_for_replication_calc] PRIMARY KEY CLUSTERED ([id])
)
GO

ALTER TABLE [dbo].[Supported_t_check_not_for_replication_calc] WITH NOCHECK
  ADD CONSTRAINT [check_number_calc] CHECK ([number]>(0))
GO