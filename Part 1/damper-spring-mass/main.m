%% Dynamic System Modeling and Simulation 
% Aforozi Thomais 9291
% Work 1 - Part A

%% Main Script

tspan = 0:0.1:10;
y0 = [0 0];
[ts,ysol] = ode45('dynamics', tspan, y0);

y = ysol(:,1);

[estm,estb,estk,esttheta,ymodel] = LeastSquare(y);

figure;
subplot(1,3,1)
plot(ts, y, 'LineWidth', 1.2);
title('Real output','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{real}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

% figure;
subplot(1,3,2)
plot(ts, ymodel, 'LineWidth', 1.2);
title('Model output','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{model}$','Interpreter', 'Latex', 'fontsize', 12);

% figure;
subplot(1,3,3)
ErrorOfY = y - ymodel;
plot(ts, ErrorOfY, 'LineWidth', 1.2);
title('$e_{y}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{real} - y_{model}$','Interpreter', 'Latex', 'fontsize', 12);
