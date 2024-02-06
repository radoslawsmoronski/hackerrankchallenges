DECLARE @MaxValue INT
SET @MaxValue = 1000

DECLARE @Counter INT
SET @Counter = 1

DECLARE @Result NVARCHAR(MAX)
SET @Result = ''

WHILE @Counter <= @MaxValue
BEGIN
    DECLARE @InsideCounter INT
    SET @InsideCounter = 1
    DECLARE @DividerAmount INT
    SET @DividerAmount = 0
    
    WHILE @InsideCounter <= @Counter
    BEGIN
        IF(@Counter % @InsideCounter = 0)
        BEGIN
            SET @DividerAmount += 1
        END

        SET @InsideCounter += 1
    END

    IF(@DividerAmount = 2)
    BEGIN
        SET @Result += CAST(@Counter AS NVARCHAR(1000)) + '&'
    END

    SET @Counter = @Counter + 1
END

SET @Result = LEFT(@Result, LEN(@Result) - 1)
PRINT @Result