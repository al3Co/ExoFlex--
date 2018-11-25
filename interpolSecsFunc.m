% interpolate seconds of date vector
function A = interpolSecsFunc (A)
A(:,1:3) = [];
A = [A zeros(size(A,1),1)];

% find changes of seconds
for i = 1:length(A)-1
    if A(i,3) - A((i+1),3) == -1
        ch(i+1,:) = 1;
    else
        ch(i+2,:) = 0;
    end
end
% add last change to vector
ch(length(A),:) = 1;

% find indices
vals = find(ch==1);

% get number of elements between seconds
qty = [];
qty(1,:) = (vals(1));
for i = 2:length(vals)
    qty(i,:) = (vals(i)-vals(i-1));
end

% fill each second with 0 to 999 data
for i = 1:length(qty)
    if i == 1
        x = 0:999/(qty(i)-1):999;
        x(:,1)=[];
        x = x';
        A(1:vals(i)-1,4) = x;
    else
        x = 0:999/(qty(i)):999;
        A(vals(i-1):vals(i),4) = x;
    end
end
% convert to int
A(:,4) = round(A(:,4));
end

