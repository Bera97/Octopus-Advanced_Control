clear all;

x_start = -2;
y_start = -2;
x_end = 2;
y_end = 2;

[XX, YY] = meshgrid(x_start:0.1:x_end,y_start:0.1:y_end);

f = {@(x,y)-(6*x)./((1+x.^2).^2)+2*y; @(x,y)-2*(x+y)./((1+x.^2).^2)};

U = f{1}(XX, YY);
V = f{2}(XX, YY);

figure(1)
quiver(XX,YY,U,V, 'k', 'LineWidth',1.2)
xlim([x_start-0.05 x_end+0.05])
ylim([y_start-0.05 y_end+0.05])
grid on;