%% Define parameters
alpha = 0.1;
epsilon = 0.08;
gamma = 0.9;
params = [alpha, epsilon, gamma];

pulse_duration = 1;
pulse_magnitude = 0.5; 
pulse_period = 10; 

I = @(t) (mod(t, pulse_period) < pulse_duration) * pulse_magnitude;
% I = @(t) 0.5;

t0 = 0;

tf = 100;
tspan = [t0,tf];

IV = [0.5;0];

%% Solve equation
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);
[t, v] = ode15s(@(t, v) fitzhugh_nagumo(t, v, I, params), tspan, IV, options);


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
plot(t,I(t), '-')
grid on
xlabel('Time,t')
ylabel('I(t)')

% figure
% plot(v(:, 1), v(:, 2))
% grid on 
% title('Phase Plane')
% set(gca, 'Box', 'on')