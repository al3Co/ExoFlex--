% interpolation function
function x = interpolFunc (a,n,opt)
    % matrixExample
    % a=[1 -5 -2 2 4 7 9 10 13 10; 1 2 3 5 6 7 9 10 18 5]';
    % number of nans between values
    % n = 10;
    % opt = method

    [row,~] = size(a);
    rows = row*(n+1);
    a_new = [];
    flag = true;
    cFill = 1;
    c = 0;
    for r = 1:rows
        if flag == false
            a_new(r,:) = NaN;
            if c == n
                flag = true;
                c = 0;
            else
                c = c + 1;
            end
        end
        if flag
            a_new(r,:) = a(cFill,:);
            cFill = cFill + 1;
            flag = false;
        end
    end
    x = a_new(1:end-n,:);
    nanx = isnan(x);
    t    = 1:numel(x);
    % 1 for time secs
    % 2 for time milisecs
    % 3 for data
    if opt == 1
        x(nanx) = interp1(t(~nanx), x(~nanx), t(nanx), 'nearest');
    elseif opt == 2
        x(nanx) = interp1(t(~nanx), x(~nanx), t(nanx), 'spline');
    elseif opt == 3
        x(nanx) = interp1(t(~nanx), x(~nanx), t(nanx), 'PCHIP');
    end
end
