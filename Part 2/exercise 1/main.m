%% Modelling and Simulation of dynamical systems 
% Aforozi Thomais 9291
% Work 2 - Part A

%% Main Script
clear all;
close all;

tspan = 0:0.01:15;
initialSystem = [0 0 0 0 0];

global a;
global b;
global am;
global gamma;
a = 2;
b = 1;
am = 5;
gamma = 112; 

[ts, xs] = ode45('dynamics', tspan, initialSystem);

x = xs(:,1);
phi1 = xs(:,2);
phi2 = xs(:,3);
thetaHat1 = xs(:,4);
thetaHat2 = xs(:,5);
 
thetaHat = [thetaHat1 thetaHat2] ;
phi = [phi1 phi2];

xHat = thetaHat1 .* phi1 + thetaHat2 .* phi2;

esta = am - thetaHat1;
estb = thetaHat2;

% Lyapunov function
V =  (1/2)*(esta-a).^2 + (1/2)*(estb-b).^2;

%% Plots
subplot(1,3,1);
plot(ts, x, 'LineWidth', 1.2);
title('Real x', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('x', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2);
plot(ts, xHat, 'LineWidth', 1.2);
title('Estimated x', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('xhat', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3);
plot(ts, x-xHat, 'LineWidth', 1.2);
title('Identification Error', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('x-xhat', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

figure;
plot(ts, esta, ts, estb, 'LineWidth', 1.2);
leg1 = legend('$\hat{a}_{1}$','$\hat{b}_{2}$');
set(leg1,'Interpreter','latex', 'fontsize', 12);
title('Estimated Values', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('a, b', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);
figure;
plot(ts, V, 'LineWidth', 1.2);
title('Lyapunov Function', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('V', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

