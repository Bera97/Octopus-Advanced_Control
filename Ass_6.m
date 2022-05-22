clear all;
close all;
figure(1)

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

figure(2)

t = linspace(-0.1, 2, 1000);

c = [0.1, 10];

x = c(1).*sin(t).*exp(-t);
subplot(1,2,1);
plot(t, x);
grid on;
hold on;   
legend('c = 0.1')
xlabel('t')
ylabel('x(t)')
x = c(2).*sin(t).*exp(-t);
subplot(1,2,2);
plot(t, x);
hold on;
grid on;
legend('c = 10')
xlabel('t')
ylabel('x(t)')

figure(3)

t = linspace(0, 2, 1000);

c = [0.1, 10];

x = c(1).*sin(t).*exp(-t);
subplot(1,2,1);
plot(t, x);
grid on;
hold on;   
legend('c = 0.1')
xlabel('t')
ylabel('x(t)')
x = c(2).*sin(t).*exp(-t);
subplot(1,2,2);
plot(t, x);
hold on;
grid on;
legend('c = 10')
xlabel('t')
ylabel('x(t)')

figure(4)

t = linspace(0, 5, 1000);

for c = -5:5
    x = c.*sin(t).*exp(-t);
    plot(t, x);
    grid on;
    hold on;
end
xlabel('t')
ylabel('x(t)')