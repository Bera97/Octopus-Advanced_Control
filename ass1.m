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