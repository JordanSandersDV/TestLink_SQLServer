CREATE TABLE [dbo].[Supported_t_xml_content] (
  [id] [int] NOT NULL,
  [xml_content] [xml] (CONTENT dbo.Supported_XML_Schema_Collection) NULL,
  CONSTRAINT [pk_xml_content] PRIMARY KEY CLUSTERED ([id])
)
GO