function dxode = lyapunovMethod(t,xode)
% define variables
x1 = xode(1);
x2 = xode(2);
x1hat = xode(3);
x2hat = xode(4);
a11hat = xode(5); a12hat = xode(6); a21hat = xode(7); a22hat = xode(8);
b1hat = xode(9); b2hat = xode(10);

% init constants
global A;
global B;
global gamma;

% define derivatives
dxode = zeros(size(xode));

% errors
e1 = x1 - x1hat;
e2 = x2 - x2hat;

dxode(1) = A(1,1) * x1 + A(1,2) * x2 + B(1) * u(t); % x1dot =..
dxode(2) = A(2,1) * x1 + A(2,2) * x2 + B(2) * u(t); % x2dot=..

dxode(3) = a11hat * x1hat + a12hat * x2hat + b1hat * u(t); % x1hatdot =..
dxode(4) = a21hat * x1hat + a22hat * x2hat + b2hat * u(t); % x2hatdot=..

dxode(5) = gamma(1) * x1hat * e1; % a11hat dot=..
dxode(6) = gamma(1) * x2hat * e1; % a12hat
dxode(7) = gamma(1) * x1hat * e2; % a21hat
dxode(8) = gamma(1) * x2hat * e2; % a22hat

dxode(9) = gamma(2) * u(t) * e1; % b1hat
dxode(10) = gamma(2) * u(t) * e2; % b2hat

end