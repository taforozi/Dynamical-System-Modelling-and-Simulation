%% Dynamic System Modeling and Simulation 
% Aforozi Thomais 9291
% Work 1 - Part B 

%% Main Script
clear all;
close all;

tstart = 0;
step = 0.00001;
tend = 6;
time = tstart:step:tend;

%% Get correct values for VC and VR + LS
flag = 0;
[VcReal,VrReal,Vout] = getVsignals(time,flag);

[theta,Vcmodel] = LeastSquare(VcReal,time);

Vrmodel = u1(time) + u2(time) - Vcmodel;

%% Get incorrent values for VC and VR + LS
flag = 1;
[VcRealError,VrRealError] = getVsignals(time,flag);

[thetaEr,VcmodelEr] = LeastSquare(VcRealError,time);

VrmodelEr = u1(time) + u2(time) - VcmodelEr;


%% Plots for correct values

subplot(1,3,1)
plot(time, VcReal, 'LineWidth', 1.2);
title('Real $V_{C}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2)
plot(time, Vcmodel, 'LineWidth', 1.2);
title('Model $V_{C}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)
plot(time, VcReal-Vcmodel, 'LineWidth', 1.2);
title('$e_{V_{C}}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{C,real} - V_{C,model}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)');

figure;
subplot(1,3,1)
plot(time, VrReal, 'LineWidth', 1.2);
title('$Real V_{R}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2)
plot(time, Vrmodel, 'LineWidth', 1.2);
title('Model $V_{R}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)
plot(time, VrReal-Vrmodel, 'LineWidth', 1.2);
title('$e_{V_{R}}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{R,real} - V_{R,model}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

%% Plots for incorrect values
figure;
subplot(1,3,1)

plot(time, VcRealError, 'LineWidth', 1.2);
title('Real $V_{C}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)');

subplot(1,3,2)
plot(time, VcmodelEr, 'LineWidth', 1.2);
title('Model $V_{C}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)

plot(time, VcRealError-VcmodelEr, 'LineWidth', 1.2);
title('$e_{V_{C}}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{C,real} - V_{C,model}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
 
figure;
subplot(1,3,1)
plot(time, VrRealError, 'LineWidth', 1.2);
title('Real $V_{R}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2)
plot(time, VrmodelEr, 'LineWidth', 1.2);
title('Model $V_{R}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)
plot(time, VrRealError-VrmodelEr, 'LineWidth', 1.2);
title('$e_{V_{R}}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{R,real} - V_{R,model}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
