function [m,b,k,theta,ymodel] = LeastSquare(y)

time = 0:0.1:10;

syms s
lambda = sym2poly((s+1)^2);

G1 = tf([-1 0],lambda);
G2 = tf([0 -1],lambda);
G3 = tf([0 1],lambda);

% phi = [ G1*y; G2*y; G3*u]
phi1 = lsim(G1,y,time);
phi2 = lsim(G2,y,time);
phi3 = lsim(G3,u(time),time);

PHI = [phi1 phi2 phi3];

theta = y'*PHI/(PHI'*PHI);

m = 1/theta(3);
b = (2 + theta(1))*m;
k = (1 + theta(2))*m;

ymodel = PHI*theta';

end
