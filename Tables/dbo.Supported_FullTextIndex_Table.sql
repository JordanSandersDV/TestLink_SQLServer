CREATE TABLE [dbo].[Supported_FullTextIndex_Table] (
  [c1] [int] NOT NULL,
  [c2] [char](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
  [c3] [varchar](20) COLLATE Cyrillic_General_CI_AS NULL
)
GO

CREATE UNIQUE INDEX [ind]
  ON [dbo].[Supported_FullTextIndex_Table] ([c2])
GO