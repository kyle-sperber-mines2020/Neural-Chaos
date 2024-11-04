function dxdt = fitzhugh_nagumo(t, V, w, I, params)
alpha = params(1);
epsilon = params(2);
gamma = params(3);

dxdt = zeros(2, 1);
dxdt(1) = V .* (V - alpha) .* (1 - V) - w + I(t);
dxdt(2) = epsilon * (V - gamma * w);
end