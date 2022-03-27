clear;
x_start = 0;
y_start = 0;
x_end = 2;
y_end = 2;

[x, y] = meshgrid(x_start:0.1:x_end,y_start:0.1:y_end);

u = -(6.*x)./((1+x.^2).^2)+2.*y;
v = -(2.*x+2.*y)./((1+x.^2).^2);
% Model
f = {@(x,y)-6.*x./((1+x.^2).^2)+2.*y; @(x,y)-(2.*x+2.*y)./((1+x.^2).^2)};

U = f{1}(x, y);
V = f{2}(x, y);
    
quiver(x,y,u,v,'LineWidth',1);
hold on;

% Initial Point 
X = [0; 2];

% Model
f = {@(x,y)-6.*x./((1+x.^2).^2)+2.*y; @(x,y)-(2.*x+2.*y)./((1+x.^2).^2)};


% Step Height
step = 0.01;

% Final time 
end_time = 5;
counter = 1;

for dt = 0:step:end_time
    K1 = [f{1}(X(1), X(2)); f{2}(X(1), X(2))];
    K2 = [f{1}(X(1) + K1(1).*(step/2), X(2) + K1(2).*(step/2)); f{2}(X(1) + K1(1).*(step/2), X(2) + K1(2).*(step/2))];
    K3 = [f{1}(X(1) + K2(1).*(step/2), X(2) + K2(2).*(step/2)); f{2}(X(1) + K2(1).*(step/2), X(2) + K2(2).*(step/2))];
    K4 = [f{1}(X(1) + K3(1).*(step), X(2) + K3(2).*(step)); f{2}(X(1) + K3(1).*(step), X(2) + K3(2).*(step))];
    
    data(:, counter) = X;
    X = X + (K1 + 2.*K2 + 2.*K3 + K4).*step./6;
    counter = counter + 1;
end
plot(data(1, :), data(2,:));


