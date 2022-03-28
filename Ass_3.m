clear;
close all;
t = linspace(0, 6, 100);

for c = 1:10
    x = c.*sin(t).*exp(-t);
    x_t = (1./tan(t) - 1).*x;
    subplot(1,2,1);
    plot(t, x);
    hold on;
    subplot(1,2,2);
    plot(t, x_t);
    hold on;
    
end

grid on;