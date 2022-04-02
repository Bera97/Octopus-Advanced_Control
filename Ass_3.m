clear all;
close all;
t = linspace(0, 6, 1000);

for c = -5:5
    x = c.*sin(t).*exp(-t);
    x_t = (1./tan(t) - 1).*x;
    subplot(1,2,1);
    plot(t, x);
    grid on;
    hold on;
    subplot(1,2,2);
    plot(t, x_t);
    hold on;
    grid on;
    
end