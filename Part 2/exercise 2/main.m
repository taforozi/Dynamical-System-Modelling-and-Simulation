%% Modelling and Simulation of dynamical systems 
% Aforozi Thomais 9291
% Work 2 - Part B

%% Main Script  
clear all;
close all;

tspan = 0:0.001:25;
initialSystem = [0 0 0 0];

global a;
global b;
global pgamma;
global mgamma;
global theta_m;

a = 2;
b = 1;
pgamma = [3 1];
mgamma = [4 1];
theta_m = 5;

%% Parallel model with and without noise
[ts1,parSol] = ode45('parallel', tspan, initialSystem);

par_x = parSol(:,1);  
par_thetaHat1 = parSol(:,2); 
par_thetaHat2 = parSol(:,3); 
par_xHat = parSol(:,4); 

[ts2,parNoiseSol] = ode45('parallelNoise', tspan, initialSystem);

parNo_x = parNoiseSol(:,1); 
parNo_thetaHat1 = parNoiseSol(:,2); 
parNo_thetaHat2 = parNoiseSol(:,3); 
parNo_xHat = parNoiseSol(:,4); 

% Lyapunov functions
Vpar = (1/2)*((par_x - par_xHat).^2 + (1/pgamma(1))*(par_thetaHat1-a).^2 +(1/pgamma(2))*(par_thetaHat2-b).^2);
VparNoise = (1/2)*((parNo_x - parNo_xHat).^2 + (1/pgamma(1))*(parNo_thetaHat1 - a).^2 + ...
                (1/pgamma(2))*(parNo_thetaHat2 - b).^2);

%% Series-Parallel model with and without noise

[ts3,mixSol] = ode45('mixed', tspan, initialSystem);

mix_x = mixSol(:,1);  
mix_thetaHat1 = mixSol(:,2); 
mix_thetaHat2 = mixSol(:,3); 
mix_xHat = mixSol(:,4); 

[ts4,mixNoiseSol] = ode45('mixedNoise', tspan, initialSystem);

mixNo_x = mixNoiseSol(:,1);  
mixNo_thetaHat1 = mixNoiseSol(:,2); 
mixNo_thetaHat2 = mixNoiseSol(:,3);  
mixNo_xHat = mixNoiseSol(:,4);

% Lyapunov functions
Vmix = (1/2)*((mix_x - mix_xHat).^2 + (1/mgamma(1))*(mix_thetaHat1 - a).^2 + (1/mgamma(2))*(mix_thetaHat2 - b).^2 );
VmixNoise = (1/2)*((mixNo_x - mixNo_xHat).^2 + (1/mgamma(1))*(mixNo_thetaHat1 - a).^2 + ...
            (1/mgamma(2))*(mixNo_thetaHat2-b).^2);

%% Plots of parallel form without noise
subplot(1,3,1)
plot(tspan, par_x,'LineWidth', 1.2);
title('Real x - Parallel - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('x','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,2)
plot(tspan , par_xHat,'LineWidth', 1.2);
title('xHat - Parallel - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('xHat','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,3)
plot(tspan , par_x - par_xHat,'LineWidth', 1.2);
title('e = x - xHat','Interpreter','Latex', 'fontsize', 12);
ylabel('e','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
figure;

plot(tspan, par_thetaHat1, tspan, par_thetaHat2,'LineWidth', 1.2);
leg1 = legend('$\hat{\theta}_{1}$','$\hat{\theta}_{2}$');
set(leg1,'Interpreter','latex', 'fontsize', 12);
title('Theta - Parallel - Noise free','Interpreter','Latex', 'fontsize', 12);
figure;

plot(tspan , Vpar,'LineWidth', 1.2);
title('Lyapunov function - Parallel - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('V','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
figure;

%% Plots of parallel form with noise

subplot(1,3,1)
plot(tspan, parNo_x,'LineWidth', 1.2);
title('Real x - Parallel - with Noise','Interpreter','Latex', 'fontsize', 12);
ylabel('x','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,2)
plot(tspan , parNo_xHat,'LineWidth', 1.2);
title('xHat - Parallel - With Noise','Interpreter','Latex', 'fontsize', 12);
ylabel('xHat','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,3)
plot(tspan , par_x - parNo_xHat,'LineWidth', 1.2);
title('e = x - xHat','Interpreter','Latex', 'fontsize', 12);
ylabel('e','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
figure;

plot(tspan, parNo_thetaHat1, tspan, parNo_thetaHat2,'LineWidth', 1.2);
leg2 = legend('$\hat{\theta}_{1,noise}$','$\hat{\theta}_{2,noise}$');
set(leg2,'Interpreter','latex', 'fontsize', 12);
title('Theta - Parallel with Noise','Interpreter','Latex', 'fontsize', 12);

figure;
plot(tspan , VparNoise,'LineWidth', 1.2);
title('Lyapunov function - Parallel - With noise','Interpreter','Latex', 'fontsize', 12);
ylabel('V','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

%% Plots of mixed form without noise
% x , xhat, e=x-xhat, theta
figure;
subplot(1,3,1)
plot(tspan, mix_x,'LineWidth', 1.2);
title('x - Mixed - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('x','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,2)
plot(tspan, mix_xHat,'LineWidth', 1.2);
title('xHat - Mixed - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('xHat','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,3)
plot(tspan, mix_x - mix_xHat,'LineWidth', 1.2);
title('e - Mixed - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('x - xHat','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
figure;

plot(tspan, mix_thetaHat1, tspan, mix_thetaHat2,'LineWidth', 1.2);
leg3 = legend('$\hat{\theta}_{1}$','$\hat{\theta}_{2}$');
set(leg3,'Interpreter','latex', 'fontsize', 12);
title('Theta - Mixed Noise free','Interpreter','Latex', 'fontsize', 12);

figure;
plot(tspan , Vmix,'LineWidth', 1.2);
title('Lyapunov function - Mixed - Noise free','Interpreter','Latex', 'fontsize', 12);
ylabel('V','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

%% Plots of mixed form with noise
% x , xhat, e=x-xhat, theta
figure;
subplot(1,3,1);
plot(tspan, mixNo_x,'LineWidth', 1.2);
title('x - Mixed - with Noise','Interpreter','Latex', 'fontsize', 12);
ylabel('x','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,2);
plot(tspan, mixNo_xHat,'LineWidth', 1.2);
title('xHat - Mixed - with Noise','Interpreter','Latex', 'fontsize', 12);
ylabel('xHat','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
subplot(1,3,3);
plot(tspan, mixNo_x - mixNo_xHat,'LineWidth', 1.2);
title('e - Mixed - with Noise','Interpreter','Latex', 'fontsize', 12);
ylabel('x - xHat','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);

figure; 
plot(tspan, mixNo_thetaHat1, tspan, mixNo_thetaHat2,'LineWidth', 1.2);
leg4 = legend('$\hat{\theta}_{1,noise}$','$\hat{\theta}_{2,noise}$');
set(leg4,'Interpreter','latex', 'fontsize', 12);
title('Theta - Mixed with Noise','Interpreter','Latex', 'fontsize', 12);
figure; 
plot(tspan , VmixNoise,'LineWidth', 1.2);
title('Lyapunov function - Mixed - With noise','Interpreter','Latex', 'fontsize', 12);
ylabel('V','Interpreter','Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter','Latex', 'fontsize', 12);
