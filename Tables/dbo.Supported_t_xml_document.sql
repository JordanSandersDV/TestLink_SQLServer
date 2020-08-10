CREATE TABLE [dbo].[Supported_t_xml_document] (
  [id] [int] NOT NULL,
  [xml_document] [xml] (CONTENT dbo.Supported_XML_Schema_Collection) NULL,
  CONSTRAINT [pk_xml_document] PRIMARY KEY CLUSTERED ([id])
)
GO