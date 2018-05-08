function [tableMatched] = addType(T, typeOfMov)
H = height(T);
type = {};
typeStr = typeOfMov;
for row = 1:H
    type{row} = typeStr;
end
T2 = table(type');
tableMatched = [T T2];