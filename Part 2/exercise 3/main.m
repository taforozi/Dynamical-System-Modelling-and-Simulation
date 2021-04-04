%% Modelling and Simulation of dynamical systems 
% Aforozi Thomais 9291
% Work 2 - Part C

%% Main Script  
clear all;

global A;
global B;
global gamma;

A = [-0.25, 3; -5 -1];
B = [1; 2.2];
gamma = [5 1.75];

tspan = 0:0.001:80;
tspan = tspan';
init = zeros(1,10);

[ts, sol] = ode45('lyapunovMethod', tspan, init);

x1 = sol(:,1);
x2 = sol(:,2);
xReal = [x1; x2];

x1hat = sol(:,3);
x2hat = sol(:,4);
xHat = [x1hat; x2hat];

a11_est = sol(:,5);
a12_est = sol(:,6);
a21_est = sol(:,7);
a22_est = sol(:,8);
A_est = [a11_est a12_est; a21_est a22_est];

b1_est = sol(:,9);
b2_est = sol(:,10);
B_est = [b1_est; b2_est];

e = xReal - xHat;
tildeA = [a11_est-A(1,1) a12_est-A(1,2) a21_est-A(2,1) a22_est-A(2,2)];
tildeB = [b1_est-B(1,1) b2_est-B(2,1)];

% Lyapunov function
V = zeros(length(tspan),1);
for i=1:length(tspan)
    V(i) = (1/2)*((e(i,:)'*e(i,:))^2 + (1/gamma(1)) * trace(tildeA(i,:)'*tildeA(i,:)) + ...
           (1/gamma(2))*trace(tildeB(i,:)'*tildeB(i,:)));
end

%% Plots
figure;
subplot(2,3,1);
plot(tspan, x1,'LineWidth', 1.2);
title('Real $x_1$','Interpreter','Latex', 'fontsize', 12);
ylabel('x','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(2,3,2);
plot(tspan, x1hat,'LineWidth', 1.2);
title('Estimated $x_1$','Interpreter','Latex', 'fontsize', 12);
ylabel('$\hat{x}_1$','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(2,3,3);
plot(tspan, x1-x1hat,'LineWidth', 1.2);
title('$e_1 = x_1 - \hat{x}_1$','Interpreter','Latex', 'fontsize', 12);
ylabel('$e_2$','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(2,3,4);
plot(tspan, x2,'LineWidth', 1.2);
title('Real $x_2$','Interpreter','Latex', 'fontsize', 12);
ylabel('x','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(2,3,5);
plot(tspan, x2hat,'LineWidth', 1.2);
title('Estimated $x_2$','Interpreter','Latex', 'fontsize', 12);
ylabel('$\hat{x}_2$','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(2,3,6);
plot(tspan, x2-x2hat,'LineWidth', 1.2);
title('$e_2 = x_2 - \hat{x}_2$','Interpreter','Latex', 'fontsize', 12);
ylabel('$e_2$','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

figure;
plot(tspan,a11_est,tspan,a12_est,tspan,a21_est,tspan,a22_est,'LineWidth', 1.2);
lega = legend('$a_{11}$','$a_{12}$','$a_{21}$','$a_{22}$');
set(lega,'Interpreter','latex', 'fontsize', 12);
title('Estimated Values $  a_{ij} $','Interpreter','Latex', 'fontsize', 12);
ylabel('A','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

figure;
plot(tspan, b1_est, tspan, b2_est,'LineWidth', 1.2);
legb = legend('$b_1$','$b_2$');
set(legb,'Interpreter','latex', 'fontsize', 12);
title('Estimated Values $b_{i}$','Interpreter','Latex', 'fontsize', 12);
ylabel('B','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

figure; 
plot(tspan,V,'LineWidth', 1.2);
title('Lyapunov function','Interpreter','Latex', 'fontsize', 12);
ylabel('V','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

