%% Define parameters

% Modeling Life Parameter Values
alpha = 0.1;
epsilon = 0.008;
gamma = 0.5;

params = [alpha, epsilon, gamma];

pulse_duration = 1;
pulse_magnitude = 0.5; 
pulse_period = 30; % 400 for single pulse, 50 for stable cycle, 30 for chaos

I = @(t) (mod(t, pulse_period) < pulse_duration) * pulse_magnitude;
% I = @(t) 0.1; % 0.15 limit cycle, 0.1 for stable EP
% I = @(t) sin(t/50)*0.5;

t0 = 0;
tf = 1000;
tspan = [t0,tf];

IV = [0.5;0];

%% Solve equation
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);
% [t, v] = ode15s(@(t, v) fitzhugh_nagumo(t, v, I, params), tspan, IV, options);
[t,v] = ode45(@(t,v) fitzhugh_nagumo(t,v,I,params), tspan, IV, options);

% Remove transient behavior
IV = [v(end,1), v(end,2)];
[t,v] = ode45(@(t,v) fitzhugh_nagumo(t,v,I,params), tspan, IV, options);

%% Plot results
close all
figure;
subplot(3,1,[1,2])
plot(t,v,'-'); 
grid on
legend("V", "W")
xlabel('Time, t');
ylabel('Voltage, V');

subplot(3,1,3)
plot(t,I(t), '-r')
grid on
xlabel('Time,t')
ylabel('I(t)')
% ylim([-0.25 0.25])

figure
plot(v(:, 1), v(:, 2))
grid on 
title('Phase Plane')
set(gca, 'Box', 'on')

%% Poincare Plot
[peaks, times] = findpeaks(v(:,1), t);

figure;
plot(peaks(1:end-1), peaks(2:end), '*'); 
grid on;
xlabel('V_n');
ylabel('V_{n+1}');
title('Poincare Plot');