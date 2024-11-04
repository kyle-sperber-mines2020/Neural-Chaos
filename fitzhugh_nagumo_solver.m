%% Define parameters
alpha = 2;
epsilon = 0.08;
gamma = 0.1;
params = [alpha, epsilon, gamma];

I = @(t) sin(t);

t0 = 0;
tf = 10;
tspan = [t0,tf];

IV = [0;0];

%% Solve equation
[t,v] = ode45(@(t,v) fitzhugh_nagumo(t, v, I, params), tspan, IV);


%% Plot results
figure;
plot(t,v,'-'); 
title('TITLE');
xlabel('Time, t');
ylabel('Voltage, V');
set(gca,'FontSize',16);

figure
plot(v(:, 1), v(:, 2))
