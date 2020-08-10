CREATE TABLE [schm_history].[Supported_t_history] (
  [id] [int] NOT NULL,
  [clm] [varchar](50) NOT NULL,
  [SysStartTime] [datetime2] NOT NULL,
  [SysEndTime] [datetime2] NOT NULL
)
GO

CREATE CLUSTERED INDEX [ix_Supported_t_history]
  ON [schm_history].[Supported_t_history] ([SysEndTime], [SysStartTime])
GO