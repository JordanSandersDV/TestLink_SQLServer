CREATE TYPE [dbo].[Supported_UT_Content] AS TABLE (
  [Var_Char] [xml] (CONTENT dbo.Supported_XML_Schema_Collection) NULL
)
GO