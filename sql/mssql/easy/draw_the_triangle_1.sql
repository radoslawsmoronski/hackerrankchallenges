declare @starAmount INT = 20;

while @starAmount > 0
begin
    PRINT REPLICATE('* ', @starAmount);
    set @starAmount = @starAmount - 1;
end