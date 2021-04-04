function [theta,Vcmodel] = LeastSquare(y1,time)
%y1 = Vc
%y2 = Vr

syms s
lambda = sym2poly((s+120)^2);

g1 = tf([-1 0],lambda);
g2 = tf([0 -1],lambda);
g3 = tf([1 0],lambda);
g4 = tf([0 1],lambda);
g5 = tf([1 0],lambda);
g6 = tf([0 1],lambda);

phi1 = lsim(g1,y1,time);
phi2 = lsim(g2,y1,time);
phi3 = lsim(g3,u1(time),time);
phi4 = lsim(g4,u1(time),time);
phi5 = lsim(g5,u2(time),time);
phi6 = lsim(g6,u2(time),time);

phi = [phi1 phi2 phi3 phi4 phi5 phi6];

theta = y1'*phi/((phi'*phi));

Vcmodel = phi*theta';
% Vcmodel = Vcmodel'

end