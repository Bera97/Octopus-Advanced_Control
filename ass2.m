clear all;

% x_start = 0;
% y_start = 0;
% x_end = 2;
% y_end = 2;
% 
% [YY, XX] = meshgrid(x_start:0.05:x_end,y_start:0.05:y_end);
% 
% i=0;
% j=0;
% 
% for x = x_start:0.05:x_end
%     
%     i = i+1;
%     j=0;
%     
%     for y = y_start:0.05:y_end
% 
%         j = j+1;
%                
%         u = x*(1-y);
%         v = y*(x-1);
%         
%         U(i,j) = u;
%         V(i,j) = v;
%         
%     end
% end
% 
% figure(1)
% quiver(XX,YY,U,V, 'k', 'LineWidth',1.2)
% xlim([x_start-0.05 x_end+0.05])
% ylim([y_start-0.05 y_end+0.05])

x_start = 0;
y_start = 0;
x_end = 2;
y_end = 2;

[XX, YY] = meshgrid(x_start:0.05:x_end,y_start:0.05:y_end);

f = {@(x,y)x.*(1-y); @(x,y)y.*(x-1)};

U = f{1}(XX, YY);
V = f{2}(XX, YY);

figure(1)
quiver(XX,YY,U,V, 'k', 'LineWidth',1.2)
% xlim([x_start-0.05 x_end+0.05])
% ylim([y_start-0.05 y_end+0.05])