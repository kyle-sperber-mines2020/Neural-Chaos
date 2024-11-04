%% Define parameters
alpha = 0;
epsilon = 0;
gamma = 0;
params = [alpha, epsilon, gamma];

I = @(t) sin(t);

t0 = 0;
tf = 0;
tspan = [t0,tf];

IV = [0;0];

%% Solve equation
[t,v] = ode45(@(t,v) fitzhugh-nagumo(t, v, I, params), tspan, IV);


%% Plot results
figure;
plot(t,v,'-'); 
title('TITLE');
xlabel('Time, t');
ylabel('Voltage, V');
set(gca,'FontSize',16);
