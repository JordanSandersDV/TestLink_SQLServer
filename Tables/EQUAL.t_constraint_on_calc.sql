SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [EQUAL].[t_constraint_on_calc] (
  [x] [int] NULL,
  [id] AS ([x]*(2)) PERSISTED NOT NULL,
  [txt] [text] NULL,
  [varchar_max] [varchar](max) NULL,
  CONSTRAINT [pk_constraint_on_calc] PRIMARY KEY CLUSTERED ([id])
)
GO