function dxdt = fitz(t, y, I, params)
a = params(1);
b = params(2);
tau = params(3);

dxdt = zeros(2, 1);
dxdt(1) = y(1) - y(1).^3 ./3 - y(2) + I(t);
dxdt(2) = (y(1) + a - b.*y(2)) * (1/tau);
end