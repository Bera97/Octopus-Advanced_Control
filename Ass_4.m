clear all;

x_start = -3;
y_start = -3;
x_end = 3;
y_end = 3;

X_sp = 2;
Y_sp = -3;
X = [X_sp;Y_sp];

step = 0.01;

t_start = 0;
t_end = 10000;

counter = 1;

[XX, YY] = meshgrid(x_start:0.1:x_end,y_start:0.1:y_end);

f = {@(x,y)-(6*x)./((1+x.^2).^2)+2*y; @(x,y)-2*(x+y)./((1+x.^2).^2)};

U = f{1}(XX, YY);
V = f{2}(XX, YY);

figure(1)
quiver(XX,YY,U,V, 'k', 'LineWidth',1.2)
xlim([x_start-0.05 x_end+0.05])
ylim([y_start-0.05 y_end+0.05])
hold on;

for dt = t_start:step:t_end
    K1 = [f{1}(X(1), X(2)); f{2}(X(1), X(2))];
    K2 = [f{1}(X(1) + K1(1).*(step/2), X(2) + K1(2).*(step/2)); f{2}(X(1) + K1(1).*(step/2), X(2) + K1(2).*(step/2))];
    K3 = [f{1}(X(1) + K2(1).*(step/2), X(2) + K2(2).*(step/2)); f{2}(X(1) + K2(1).*(step/2), X(2) + K2(2).*(step/2))];
    K4 = [f{1}(X(1) + K3(1).*(step), X(2) + K3(2).*(step)); f{2}(X(1) + K3(1).*(step), X(2) + K3(2).*(step))];

    data(:, counter) = X;
    X = X + (K1 + 2.*K2 + 2.*K3 + K4).*step./6;
    counter = counter + 1;
end
plot(data(1, :), data(2,:));