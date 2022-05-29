%% Model Specifications

% Spring Stiffness
k = 0.1;
% Mass of Body
m = 1;
% Length of spring at rest
l = 1;

% System Matrices
A = [
    0,      0,      1, 0;
    0,      0,      0, 1;
    -2*k/m, k/m,    0, 0;
    k/m,    -k/m,   0, 0;
];

D = [
  0;
  0;
  0;
  k*l/m
];

g = [
  0;
  0;
  0;
  1/m
];

f = @(x)A*x + D;

% Model of the System
model = @(x, u) f(x) + u*g;

%% Initialization

% Initial State
x = [
    2*l;
    4*l;
    0.4; 
    0.1
];

% Initial Control Input
u = 0;

% Time Information
dt = 0.001;
end_time = 1000;
steps = 0;

for t = 0:dt:end_time
    x = x + model(x, u)*dt;
    u = -x(4);

    steps = steps + 1;
    buffer_x(:, steps) = x;
    buffer_u(:, steps) = u;
    buffer_t(:, steps) = t;
end

plot(buffer_t(1, :), buffer_x(1, :))
hold on;
plot(buffer_t(1, :), buffer_x(2, :))
xlabel('Time (seconds)');
ylabel('Position of Masses')

legend('Mass 1 position', 'Mass 2 position')


