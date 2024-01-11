declare @starAmount INT = 1;

while @starAmount < 21
begin
    PRINT REPLICATE('* ', @starAmount);
    set @starAmount = @starAmount + 1;
end