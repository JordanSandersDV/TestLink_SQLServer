CREATE TABLE [dbo].[Supported_t_check_not_for_replication_multy] (
  [id] [int] NOT NULL,
  [number1] [decimal](18, 9) NULL,
  [number2] [decimal](18, 9) NULL,
  CONSTRAINT [pk_check_not_for_replication_multy] PRIMARY KEY CLUSTERED ([id])
)
GO

ALTER TABLE [dbo].[Supported_t_check_not_for_replication_multy] WITH NOCHECK
  ADD CONSTRAINT [check_number_multy] CHECK (([number1]+[number2])>(0))
GO