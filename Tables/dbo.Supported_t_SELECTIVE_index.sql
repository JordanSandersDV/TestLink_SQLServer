CREATE TABLE [dbo].[Supported_t_SELECTIVE_index] (
  [pk] [int] NOT NULL,
  [xml_for] [xml] NOT NULL,
  [xml_with] [xml] NOT NULL,
  PRIMARY KEY CLUSTERED ([pk])
)
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [idx_only_in_source_with]
  ON [dbo].[Supported_t_SELECTIVE_index] ([xml_with])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [idx_only_in_source_for_secondary]
  ON [dbo].[Supported_t_SELECTIVE_index] ([xml_for])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [idx_only_in_source_for]
  ON [dbo].[Supported_t_SELECTIVE_index] ([xml_for])
GO