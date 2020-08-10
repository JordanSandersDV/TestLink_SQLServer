CREATE TABLE [schm_base].[Supported_t_base_temporal] (
  [id] [int] NOT NULL,
  [clm] [varchar](50) NOT NULL,
  [SysStartTime] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL,
  [SysEndTime] [datetime2] GENERATED ALWAYS AS ROW END NOT NULL,
  PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime),
  CONSTRAINT [pk_base_table] PRIMARY KEY CLUSTERED ([id])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [schm_history].[Supported_t_history], DATA_CONSISTENCY_CHECK = ON))
GO