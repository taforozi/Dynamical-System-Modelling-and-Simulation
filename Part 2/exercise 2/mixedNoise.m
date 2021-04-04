function dxode = mixedNoise(t,xode)
% define variables
x = xode(1);
th1_hat = xode(2);
th2_hat = xode(3);
x_hat = xode(4);

% init constants
global a;
global b;
global mgamma;
global theta_m;

% define derivatives
dxode = zeros(size(xode));

% error with noise
e = (x + n(t)) - x_hat;

dxode(1) = - a * x + b * u(t); 
dxode(2) = - mgamma(1) * e * (x + n(t)); 
dxode(3) = mgamma(2) * e * u(t); 
dxode(4) = - th1_hat * (x + n(t)) + th2_hat * u(t) + theta_m * e;

end