CREATE TABLE [dbo].[Supported_t_xml] (
  [id] [int] NOT NULL,
  [xml_primary] [xml] NULL,
  [xml_column] [xml] NULL,
  CONSTRAINT [pk_xml] PRIMARY KEY CLUSTERED ([id])
)
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [idx_xml]
  ON [dbo].[Supported_t_xml] ([xml_primary])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [idx_primary_xml]
  ON [dbo].[Supported_t_xml] ([xml_primary])
GO