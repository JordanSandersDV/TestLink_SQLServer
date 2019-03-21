CREATE TABLE [takeda].[MPerms] (
  [Takid] [int] NOT NULL,
  [Zip] [int] NULL,
  [PERMS] [varchar](50) NULL,
  [State] [varchar](50) NULL,
  CONSTRAINT [PK_MPerms_Takid] PRIMARY KEY CLUSTERED ([Takid])
)
ON [PRIMARY]
GO