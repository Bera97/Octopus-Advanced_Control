%% Clear Everything
clc;
clear;
close all;

%% Trajectory Specifications

f1 = 1;
f2 = 6;
f3 = 0.2;
R = 20;

x_t = @(t)R*sin(f1*t) + R*sin(f2*t);
y_t = @(t)R*cos(f1*t) + R*cos(f2*t);
z_t = @(t)R*sin(f3*t);

x_t_dot = @(t)R*f1*cos(f1*t) + R*f2*cos(f2*t);
y_t_dot = @(t)-R*f1*sin(f1*t) - R*f2*sin(f2*t);
z_t_dot = @(t)R*f3*cos(f3*t);

x_t_ddot = @(t)-R*f1^2*sin(f1*t) - R*f2^2*sin(f2*t);
y_t_ddot = @(t)-R*f1^2*cos(f1*t) - R*f2^2*cos(f2*t);
z_t_ddot = @(t)-R*f3^2*sin(f3*t);

%% System Model

% Model of the System
model = @(x, u) [
    x(4)*cos(x(6))*cos(x(7));
    x(4)*cos(x(6))*sin(x(7));
    -x(4)*sin(x(6));
    u(1);
    -0.1*sin(x(5))*cos(x(6)) + x(4)*tan(x(6))*(u(2)*sin(x(5)) + u(3)*cos(x(5)));
    x(4)*(u(2)*cos(x(5)) - u(3)*sin(x(5)));
    x(4)*(u(2)*sin(x(5))/cos(x(6)) + u(3)*cos(x(5))/cos(x(6)));    
];

%% Virtual Controller
a_0 = 1;
a_1 = 2;
a_2 = 1;

v_controller = @(x, x_dot, x_t, x_t_dot, x_t_ddot)a_0*(x_t - x) + a_1*(x_t_dot - x_dot) + a_2*x_t_ddot;

%% Controller 
A_inv_11 = @(x)x(4)^4*cos(x(7))*cos(x(6));
A_inv_21 = @(x)-x(4)^2*(sin(x(5))*sin(x(7)) + cos(x(5))*cos(x(7))*sin(x(6)));
A_inv_31 = @(x)x(4)^2*(-cos(x(5))*sin(x(7)) + cos(x(7))*sin(x(5))*sin(x(6)));

A_inv_12 = @(x)x(4)^4*cos(x(6))*sin(x(7));
A_inv_22 = @(x)x(4)^2*(cos(x(7))*sin(x(5)) - cos(x(5))*sin(x(7))*sin(x(6)));
A_inv_32 = @(x)x(4)^2*(cos(x(5))*cos(x(7)) + sin(x(5))*sin(x(7))*sin(x(6)));

A_inv_13 = @(x)-x(4)^4*sin(x(6));
A_inv_23 = @(x)-x(4)^2*cos(x(5))*cos(x(6));
A_inv_33 = @(x)x(4)^2*cos(x(6))*sin(x(5));


A_inv = @(x)(1/x(4)^4).*[
    A_inv_11(x), A_inv_12(x), A_inv_13(x);
    A_inv_21(x), A_inv_22(x), A_inv_23(x);
    A_inv_31(x), A_inv_32(x), A_inv_33(x);
];

%% Initialization

% Initial State
X = ones(7, 1)*5;

% Initial Control Input
u = zeros(3,1);

% Initial Virtual Control
u_bar = zeros(3,1);

% Time Information
dt = 0.0001;
end_time = 10;
steps = 0;

%% Simulation
for t = 0:dt:end_time
    % Euler Integration
    X_dot = model(X, u);
    X = X + X_dot.*dt;
    
    % virtual control for x, y and z
    u_bar(1) = v_controller(X(1), X_dot(1), x_t(t), x_t_dot(t), x_t_ddot(t));
    u_bar(2) = v_controller(X(2), X_dot(2), y_t(t), y_t_dot(t), y_t_ddot(t));
    u_bar(3) = v_controller(X(3), X_dot(3), z_t(t), z_t_dot(t), z_t_ddot(t));

    if X(4) == 0
        u(1) = 0.1;
    else
        u = A_inv(X)*u_bar;
    end

    % Storing the results
    steps = steps + 1;
    buffer_x(:, steps) = X;
    buffer_u(:, steps) = u;
    buffer_t(:, steps) = t;
end

%% Plot

% Trajectory Plots
figure;
% Desired Trajectory
plot3(x_t(buffer_t(1, :)), y_t(buffer_t(1, :)), z_t(buffer_t(1, :)), 'r')
hold on;
% Actual Trajectory
plot3(buffer_x(1, :), buffer_x(2, :), buffer_x(3, :), 'b');

xlabel('X (meters)');
ylabel('Z (meters)');
zlabel('Z (meters)');
legend('Desired Trajectory', 'Actual Trajectory');

% Axis plots
figure;
subplot(1,3,1);
plot(buffer_t(1, :), buffer_x(1, :))
hold on
plot(buffer_t(1, :), x_t(buffer_t(1, :)))
xlabel('Time (seconds)');
ylabel('X (meters)');
legend('Actual Trajectory', 'Desired Trajectory');

subplot(1,3,2);
plot(buffer_t(1, :), buffer_x(2, :))
hold on
plot(buffer_t(1, :), y_t(buffer_t(1, :)))
xlabel('Time (seconds)');
ylabel('Y (meters)');
legend('Actual Trajectory', 'Desired Trajectory');

subplot(1,3,3);
plot(buffer_t(1, :), buffer_x(3, :))
hold on
plot(buffer_t(1, :), z_t(buffer_t(1, :)))
xlabel('Time (seconds)');
ylabel('Z (meters)');
legend('Actual Trajectory', 'Desired Trajectory');

