USE [StoredProcExp]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProductDesc]

SELECT	'Return Value' = @return_value

GO
