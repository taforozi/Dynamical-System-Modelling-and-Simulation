function dxode = parallelNoise(t,xode)
% define variables
x = xode(1);
th1_hat = xode(2);
th2_hat = xode(3);
x_hat = xode(4);

% init constants
global a;
global b;
global pgamma;

% define derivatives
dxode = zeros(size(xode));

% error with noise
e = (x + n(t)) - x_hat;

dxode(1) = - a * x + b * u(t);  
dxode(2) = - pgamma(1) * e * x_hat;  
dxode(3) = pgamma(2) * e * u(t);  
dxode(4) = - th1_hat * x_hat + th2_hat * u(t); 

end