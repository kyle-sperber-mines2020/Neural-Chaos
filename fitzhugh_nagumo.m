function dxdt = fitzhugh_nagumo(t, y, params)
alpha = params(1);
epsilon = params(2);
gamma = params(3);

dxdt = zeros(3, 1);
dxdt(1) = y(1) * (y(1) - alpha) * (1 - y(1)) - y(2) + y(3);
dxdt(2) = epsilon * (y(1) - gamma * y(2));
dxdt(3) = 0.1 * square(t);
end