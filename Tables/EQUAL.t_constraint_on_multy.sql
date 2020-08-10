CREATE TABLE [EQUAL].[t_constraint_on_multy] (
  [id1] [int] NOT NULL,
  [id2] [int] NOT NULL,
  [txt] [text] NULL,
  [varchar_max] [varchar](max) NULL,
  CONSTRAINT [pk_constraint_on_multy] PRIMARY KEY CLUSTERED ([id1], [id2])
)
GO