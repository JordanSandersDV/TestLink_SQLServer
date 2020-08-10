CREATE TABLE [dbo].[Supported_t_xml_primary] (
  [id] [int] NOT NULL,
  [xml_column] [xml] NULL,
  CONSTRAINT [pk_xml_primary] PRIMARY KEY CLUSTERED ([id])
)
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [idx_xml_primary]
  ON [dbo].[Supported_t_xml_primary] ([xml_column])
GO