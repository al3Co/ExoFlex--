%Jaime Lorenzo
%Real time correction
function [Time] = RealTimeOpti(txt)
% getting text part of the recording results
TimeChar = char(txt(1,10));
% check if it is AM or PM to add 12 hours if necessary
AoP = 0;
if TimeChar(1,25) == 'P'
    AoP = 1;
end
% eliminating the date and the format of the time
for i=1:(size(TimeChar,2)-15)
    TimeChar(1,i)='x';
end
for i=1:3
    TimeChar(1,i+23)='x';
end

TStr = erase(string(TimeChar),'x');
% new array of characters for each data generated
% referring to time
TStrh = char(TStr);
TStrm = char(TStr);
TStrs = char(TStr);

% eliminating what is not corresponding in each case:
% hours
for i=1:(size(TStrh,2)-2)
    TStrh(1,i+2) = 'x';
end
TStrh = erase(string(TStrh),'x');
if AoP == 1
    TStrh = num2str(str2double(char(TStrh)) + 12);
end

% minutes
for i=1:(size(TStrm,2)-5)
    TStrm(1,i+5) = 'x';
end
for i=1:3
    TStrm(1,i) = 'x';
end
TStrm = erase(string(TStrm),'x'); 

% seconds
for i=1:6
    TStrs(1,i) = 'x';
end
TStrs = erase(string(TStrs),'x'); 

% Converting previous strings to duration format
Time = hours(str2double(char(TStrh))) + minutes(str2double(char(TStrm))) + seconds(str2double(char(TStrs)));

end

