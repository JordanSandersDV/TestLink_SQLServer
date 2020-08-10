CREATE TABLE [dbo].[Supported_t_fill_factor_multy] (
  [id1] [int] NOT NULL,
  [id2] [int] NOT NULL,
  [bin] [varbinary](255) NULL,
  CONSTRAINT [pk_fill_factor_multy] PRIMARY KEY CLUSTERED ([id1], [id2])
)
GO