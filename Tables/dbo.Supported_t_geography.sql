CREATE TABLE [dbo].[Supported_t_geography] (
  [id] [int] NOT NULL,
  [geo1] [geography] NULL,
  [geo2] [geography] NULL,
  [geo3] [geography] NULL,
  [geo4] [geography] NULL,
  [geo5] [geography] NULL,
  [geo6] [geography] NULL,
  CONSTRAINT [pk_geography] PRIMARY KEY CLUSTERED ([id])
)
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [idx_allow_page_locks]
  ON [dbo].[Supported_t_geography] ([geo5])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [idx_allow_row_locks]
  ON [dbo].[Supported_t_geography] ([geo4])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [idx_fillfactor]
  ON [dbo].[Supported_t_geography] ([geo2])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [idx_maxdop]
  ON [dbo].[Supported_t_geography] ([geo6])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [idx_pad_index]
  ON [dbo].[Supported_t_geography] ([geo1])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [idx_sort_in_tempdb]
  ON [dbo].[Supported_t_geography] ([geo3])
GO