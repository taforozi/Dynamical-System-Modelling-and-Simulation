function dxode = dynamics(t,xode)

% define variables
x = xode(1);
phi1 = xode(2);
phi2 = xode(3);
th1_hat = xode(4);
th2_hat = xode(5);

% init constants
global a;
global b;
global am;
global gamma;

% define derivatives
dxode = zeros(size(xode));

dxode(1) = - a * x + b * u(t);  
% the laws for phi and theta that arise from the Gradient Method
dxode(2) = - am * phi1 + x; 
dxode(3) = - am * phi2 + u(t); 
dxode(4) = gamma * (x - (th1_hat * phi1 + th2_hat * phi2)) * phi1; 
dxode(5) = gamma * (x - [th1_hat, th2_hat] * [phi1; phi2]) * phi2;  
 
end
