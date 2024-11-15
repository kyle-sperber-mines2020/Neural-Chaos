%% Define parameters
alpha = 0.1;
epsilon = 0.08;
gamma = 0.1;
params = [alpha, epsilon, gamma];

I = @(t) 0.5;

t0 = 0;
tf = 100;
tspan = [t0,tf];

IV = [0;0.2];

%% Solve equation
[t,v] = ode45(@(t,v) fitzhugh_nagumo(t, v, I, params), tspan, IV);


%% Plot results
close all

% 2D Plot with Voltage against the second variable
figure;
plot(v(:, 1), v(:, 2), '-');
title('Voltage vs Current');
xlabel('Voltage, V');
ylabel('Current, w');
set(gca, 'FontSize', 16);

figure;
subplot(3, 1, [1, 2])
plot(t, v, '-')
grid on 
xlabel('Time, t')
label("V", "W")
