clear all;
close all;

eq1 = @(t) cot(t)-1;
eq2 = @(t) 0;

ax = gca;
fplot(eq1,[-pi,2*pi]);
hold on;
fplot(eq2,[-pi,2*pi],LineWidth=1.5);
set(gca,'XTick',-pi:pi/4:4*pi);
ax.XTickLabel = {'-\pi','-3\pi/4','-\pi/2','-\pi/4','0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4','2\pi'};
ylim([-5 5])
legend('cot(t)-1', '0')

grid on;