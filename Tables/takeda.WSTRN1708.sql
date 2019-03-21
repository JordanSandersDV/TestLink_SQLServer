CREATE TABLE [takeda].[WSTRN1708] (
  [TAKID] [int] NOT NULL,
  [NPI] [varchar](50) NULL,
  [Decile] [varchar](50) NULL,
  [Target] [varchar](50) NULL,
  [Area] [varchar](50) NULL,
  [Region] [varchar](50) NULL,
  [District] [varchar](50) NULL,
  [Territory] [varchar](50) NULL,
  [Footprint] [varchar](50) NULL,
  [alignment_fl] [varchar](50) NULL,
  [FNAME] [varchar](50) NULL,
  [MNAME] [varchar](50) NULL,
  [LNAME] [varchar](50) NULL,
  [ADDR] [varchar](50) NULL,
  [CITY] [varchar](50) NULL,
  [ST] [varchar](50) NULL,
  [ZIP] [int] NULL,
  [TKSPEC] [varchar](50) NULL,
  [IMID] [varchar](50) NULL,
  CONSTRAINT [PK_WSTRN1708_TAKID] PRIMARY KEY CLUSTERED ([TAKID])
)
ON [PRIMARY]
GO