clear all;

x_start = -1;
y_start = -1;
x_end = 1;
y_end = 1;

[XX, YY] = meshgrid(x_start:0.1:x_end,y_start:0.1:y_end);

f = {@(x,y)x.*(1-y); @(x,y)y.*(x-1)};

U = f{1}(XX, YY);
V = f{2}(XX, YY);

figure(1)
quiver(XX,YY,U,V, 'k', 'LineWidth',1.2)
xlim([x_start-0.05 x_end+0.05])
ylim([y_start-0.05 y_end+0.05])
grid on;