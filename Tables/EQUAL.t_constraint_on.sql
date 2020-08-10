CREATE TABLE [EQUAL].[t_constraint_on] (
  [id] [int] NOT NULL,
  [txt] [text] NULL,
  [varchar_max] [varchar](max) NULL,
  CONSTRAINT [pk_constraint_on] PRIMARY KEY CLUSTERED ([id])
)
GO