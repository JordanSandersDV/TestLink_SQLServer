CREATE TYPE [dbo].[Supported_UT_Document] AS TABLE (
  [Var_Char] [xml] (DOCUMENT dbo.Supported_XML_Schema_Collection) NULL
)
GO