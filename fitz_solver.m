%% Define parameters
a = 0.7;
b = 0.8;
tau = 12.5;
params = [a, b, tau];

I = @(t) 0.05;

t0 = 0;

tf = 5;
tspan = [t0,tf];

IV = [0.5;0];

%% Solve equation
[t,v] = ode45(@(t,v) fitz(t, v, I, params), tspan, IV);


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
plot(t,I(t))
grid on
xlabel('Time,t')
ylabel('I(t)')

% figure
% plot(v(:, 1), v(:, 2))
% grid on 
% title('Phase Plane')
% set(gca, 'Box', 'on')