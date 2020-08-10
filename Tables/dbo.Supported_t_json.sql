CREATE TABLE [dbo].[Supported_t_json] (
  [StoreID] [int] IDENTITY,
  [Address] [varchar](500) NULL,
  [jsonContent] [nvarchar](4000) NULL,
  [Longitude] AS (json_value([jsonContent],'$.address[0].longitude')),
  [Latitude] AS (json_value([jsonContent],'$.address[0].latitude'))
)
GO