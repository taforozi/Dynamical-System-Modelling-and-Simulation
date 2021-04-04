function dxode = dynamics(t,xode)

% define variables
x1 = xode(1);
x2 = xode(2);

% init constants
m = 15;
b = 0.2;
k = 2;

% define derivatives
dxode = zeros(size(xode));

dxode(1) = x2; 
dxode(2) = -(b/m)*x2 - (k/m)*x1 + (1/m)*u(t);

end