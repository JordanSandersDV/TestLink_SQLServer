SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Supported_t_fill_factor_calc] (
  [x] [int] NULL,
  [id] AS ([x]*(2)) PERSISTED NOT NULL,
  [bin] [varbinary](255) NULL,
  CONSTRAINT [pk_fill_factor_calc] PRIMARY KEY CLUSTERED ([id])
)
GO