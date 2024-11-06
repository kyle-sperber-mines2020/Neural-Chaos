%% Define parameters
alpha = 0.1;
epsilon = 0.08;
gamma = 0.1;
params = [alpha, epsilon, gamma];

t0 = 0;
tf = 100;
tspan = [t0,tf];

IV = [0;1;0.2];

%% Solve equation
[t,v] = ode45(@(t,v) fitzhugh_nagumo(t, v, params), tspan, IV);


%% Plot results
close all
figure
plot3(v(:, 1), v(:, 2), v(:, 3), '-');  % Assuming v has at least two columns
title('Phase Plane');
xlabel('Voltage, V');
ylabel('Current, w');
zlabel('Current, I');
set(gca, 'FontSize', 16);

% 2D Plot with Voltage against the second variable
figure;
plot(v(:, 1), v(:, 2), '-');
title('Voltage vs Current');
xlabel('Voltage, V');
ylabel('Current, w');
set(gca, 'FontSize', 16);

figure;
subplot(2, 1, 1);
plot(t, v, '-')
legend()
