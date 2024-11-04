function dxdt = fitzhugh_nagumo(t, y, I, params)
alpha = params(1);
epsilon = params(2);
gamma = params(3);

dxdt = zeros(2, 1);
dxdt(1) = y(1) * (y(1) - alpha) * (1 - y(1)) - y(2) + I(t);
dxdt(2) = epsilon * (y(1) - gamma * y(2));
end