%% Dynamic Systems Modeling and Simulation - Project
% Aforozi Thomais - 9291 
% PartA - Check if linear - Two basic tests of linearity

%% 1. Check Additivity
% u1 -> y1 & u2->y2
% u1+u2 -> y1+y2

close all;

t = 0:0.0001:30;

u1 = sin(t);
u2 = 0.1*cos(2*t);  utotal2 = u1 + u2;
u3 = 1.5*sin(3*t);  utotal3 = u1 + u2 + u3;
u4 = 2*cos(4*t);    utotal4 = u1 + u2 + u3 + u4;
u5 = 2.5*sin(5*t);  utotal5 = u1 + u2 + u3 + u4 + u5;
u6 = 3*cos(6*t);    utotal6 = u1 + u2 + u3 + u4 + u5 + u6;

y1 = out(t,u1); 
y2 = out(t,u2);
y3 = out(t,u3); 
y4 = out(t,u4);
y5 = out(t,u5); 
y6 = out(t,u6);

ytotal2 = out(t,utotal2);
ytotal3 = out(t,utotal3);
ytotal4 = out(t,utotal4);
ytotal5 = out(t,utotal5);
ytotal6 = out(t,utotal6);

error2 = ytotal2 - (y1+y2);
error3 = ytotal3 - (y1+y2+y3);
error4 = ytotal4 - (y1+y2+y3+y4);
error5 = ytotal5 - (y1+y2+y3+y4+y5);
error6 = ytotal6 - (y1+y2+y3+y4+y5+y6);

% plot
figure;
plot(t,u1,t,y1,'LineWidth',0.8);
leg1 = legend('$$input u_1$$','$$output y_1$$');
set(leg1,'Interpreter','latex');
xlabel('Time (sec)','Interpreter','Latex');


figure('Name','Check Additivity','NumberTitle','off');
subplot(5,3,1)
plot(t,ytotal2,'LineWidth',0.8);
title('Total output','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
ylabel('$$ y_{total2} $$','Interpreter','Latex');
subplot(5,3,2)
plot(t,y1+y2,'LineWidth',0.8,'Color','red');
leg1 = legend('$$y_{1}+y_{2}$$');
set(leg1,'Interpreter','latex');
title('Sum of discrete outputs','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{1}+y_{2} $$','Interpreter','Latex');
subplot(5,3,3)
plot(t,error2,'LineWidth',0.8)
title('Error $$e_{2}$$' ,'Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{total} - (y_{1}+y_{2}) $$','Interpreter','Latex');

subplot(5,3,4)
plot(t,ytotal3,'LineWidth',0.8);
xlabel('Time (sec)','Interpreter','Latex');
ylabel('$$ y_{total3} $$','Interpreter','Latex');
subplot(5,3,5)
plot(t,y1+y2+y3,'LineWidth',0.8,'Color','red');
leg3 = legend('$$y_{1}+y_{2}+y_{3}$$');
set(leg3,'Interpreter','latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{1}+y_{2}+y_{3} $$','Interpreter','Latex');
subplot(5,3,6)
plot(t,error3,'LineWidth',0.8)
title('$$e_{3}$$' ,'Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{total} - (y_{1}+y_{2}+y_{3}) $$','Interpreter','Latex');

subplot(5,3,7)
plot(t,ytotal4,'LineWidth',0.8);
xlabel('Time (sec)','Interpreter','Latex');
ylabel('$$ y_{total4} $$','Interpreter','Latex');
subplot(5,3,8)
plot(t,y1+y2+y3+y4,'LineWidth',0.8,'Color','red');
leg4 = legend('$$y_{1}+y_{2}+y_{3}+y_{4}$$');
set(leg4,'Interpreter','latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{1}+y_{2}+y_{3} +y_{4}$$','Interpreter','Latex');
subplot(5,3,9)
plot(t,error4,'LineWidth',0.8)
title('$$e_{4}$$' ,'Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{total} - (y_{1}+y_{2}+y_{3}+y_{4}) $$','Interpreter','Latex');

subplot(5,3,10)
plot(t,ytotal5,'LineWidth',0.8);
xlabel('Time (sec)','Interpreter','Latex');
ylabel('$$ y_{total5} $$','Interpreter','Latex');
subplot(5,3,11)
plot(t,y1+y2+y3+y4+y5,'LineWidth',0.8,'Color','red');
leg5 = legend('$$y_{1}+y_{2}+y_{3}+y_{4}+y_{5}$$');
set(leg5,'Interpreter','latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{1}+y_{2}+y_{3} +y_{4}+y_{5}$$','Interpreter','Latex');
subplot(5,3,12)
plot(t,error5,'LineWidth',0.8)
title('$$e_{5}$$' ,'Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{total} - (y_{1}+y_{2}+y_{3}+y_{4}+y_{5}) $$','Interpreter','Latex');

subplot(5,3,13)
plot(t,ytotal6,'LineWidth',0.8);
xlabel('Time (sec)','Interpreter','Latex');
ylabel('$$ y_{total6} $$','Interpreter','Latex');
subplot(5,3,14)
plot(t,y1+y2+y3+y4+y5+y6,'LineWidth',0.8,'Color','red');
leg6 = legend('$$y_{1}+y_{2}+y_{3}+y_{4}+y_{5}+y_{6}$$');
set(leg6,'Interpreter','latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{1}+y_{2}+y_{3} +y_{4}+y_{5}+y_{6}$$','Interpreter','Latex');
subplot(5,3,15)
plot(t,error6,'LineWidth',0.8)
title('$$e_{6}$$' ,'Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
% ylabel('$$ y_{total} - (y_{1}+y_{2}+y_{3}+y_{4}+y_{5}) $$','Interpreter','Latex');


%% 2. Check Homogeneity
% x2
yDouble = out(t,2*utotal6);
ymulti2 = 2*ytotal6;

figure('Name','Check Homogeneity','NumberTitle','off');
subplot(4,3,1)
plot(t, ymulti2,'LineWidth',0.8);
title('Simple output x2','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
subplot(4,3,2)
plot(t,yDouble,'LineWidth',0.8,'Color','red');
title('$$y_{double}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
subplot(4,3,3)
plot(t,ymulti2-yDouble,'LineWidth',0.8);
title('Error $$e_{double}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

% x10
yTen = out(t,10*utotal6);
ymulti10 = 10*ytotal6;

subplot(4,3,4)
plot(t, ymulti10,'LineWidth',0.8);
xlabel('Time (sec)','Interpreter','Latex');
title('Simple output x10','Interpreter','Latex');
subplot(4,3,5)
plot(t,yTen,'LineWidth',0.8,'Color','red');
title('$$y_{ten}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
subplot(4,3,6)
plot(t,ymulti10-yTen,'LineWidth',0.8);
title('$$e_{ten}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

% x100
yHundred = out(t,100*utotal6);
ymulti100 = 100*ytotal6;

subplot(4,3,7)
plot(t, ymulti100,'LineWidth',0.8);
xlabel('Time (sec)','Interpreter','Latex');
title('Simple output x100','Interpreter','Latex');
subplot(4,3,8)
plot(t,yHundred,'LineWidth',0.8,'Color','red');
title('$$y_{hundred}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
subplot(4,3,9)
plot(t,ymulti100-yHundred,'LineWidth',0.8);
title('$$e_{hundred}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

% x1000
yThousand = out(t,1000*utotal6);
ymulti1000 = 1000*ytotal6;

subplot(4,3,10)
plot(t, ymulti1000,'LineWidth',0.8);
title('Simple output x1000','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
subplot(4,3,11)
plot(t,yThousand,'LineWidth',0.8,'Color','red');
title('$$y_{thousand}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
subplot(4,3,12)
plot(t,ymulti1000-yThousand,'LineWidth',0.8);
title('$$e_{thousand}$$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
