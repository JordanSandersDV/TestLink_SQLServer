CREATE TABLE [takeda].[BP_Vacant] (
  [TAKEDAID] [int] NOT NULL,
  [Product] [varchar](50) NULL,
  [ZIP] [int] NULL,
  CONSTRAINT [PK_BP_Vacant_TAKEDAID] PRIMARY KEY CLUSTERED ([TAKEDAID])
)
ON [PRIMARY]
GO