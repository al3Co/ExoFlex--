function [allDataTable] = addType(tableSensorsData, tableMatched, typeOfMov)
H = height(tableMatched);
type = {};
typeStr = typeOfMov;
for row = 1:H
    type{row} = typeStr;
end
type = type';
T2 = table(type);
allDataTable = [tableSensorsData tableMatched T2];