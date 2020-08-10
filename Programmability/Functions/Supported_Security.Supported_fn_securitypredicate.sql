SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

    CREATE FUNCTION [Supported_Security].[Supported_fn_securitypredicate](@txt AS sysname)  
      RETURNS TABLE  
      WITH SCHEMABINDING  
    AS   
     RETURN (SELECT 1 AS fn_securitypredicate_result WHERE @txt = USER_NAME())
    
GO