function plotIntVsExt (int, ext, opt)
if opt == 1
subplot(2,1,1);
plot(int)
title('Interior')

subplot(2,1,2);
plot(ext)
title('Exterior')
end
if opt == 2
    plot([int, ext])
    title('Interior vs Exterior')
    legend('Interior','Exterior')
end

end