CREATE TABLE [dbo].[Supported_t_nonclustered_idx] (
  [id] [int] NULL,
  [bin] [varbinary](255) NULL
)
GO

CREATE UNIQUE INDEX [idx_nonclustered]
  ON [dbo].[Supported_t_nonclustered_idx] ([id])
GO