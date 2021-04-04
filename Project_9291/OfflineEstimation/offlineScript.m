%% Dynamic Systems Simulation and Modelling - Project
% Aforozi Thomais - 9291 
% PartB - Offline estimation using Least Squares method

%% Main Script
%  close all;
%  clear all;

tstep = 0.0001;
tend = 20;
time = 0:tstep:tend;

pole = 2; 

% out.p is a file that we are given so that we are able to calculate the
% actual output
y_validation = out(time,u_validation(time));

% We are looking for the best pair of input-output orders, which leads to the
% minimum modeling error. It is necessary that the orders satisfy the
% inequality n > m, in order to end up with a strictly proper transfer
% function.
i = 1;
for n = 2:6
    for m = 1:n-1    
        % estimate the values with least squares method
        thetaEst = LeastSquares(n,m,pole,time);
        
        % transfer function approximation
        % G(s) = U(s)/Y(s)
        sys_Y = ones(1,n); 
        sys_U = zeros(1,m+1);

        for j=1:n+m+1
            if j <= n
                sys_Y(j+1) = thetaEst(j); % output's coeffs
            else
                sys_U(j-n) = thetaEst(j); % input's coeffs
            end
        end

        sys_tf = tf(sys_U,sys_Y);
        % output response
        yEst = lsim(sys_tf,u_validation(time),time);   
               
        % plotting the modeling error for each combination so that we can
        % notice the minimum one.
        subplot(5,3,i)
        if abs(y_validation-yEst) <= 10^(-4) % threshold
            plot(time,y_validation-yEst,'LineWidth',0.8,'Color','green');
    
       else
            plot(time,y_validation-yEst,'LineWidth',0.8);
        end
        title(['Error for n = ' num2str(n) ' and m = ' num2str(m)],'Interpreter','Latex');
        ylabel('$$ y - \hat{y} $$','Interpreter','Latex');
        xlabel('Time (sec)','Interpreter','Latex');
        
        i = i + 1;
    end
end

% estimated values of the real parameters using the pair of n and m that arises from the
% aforementioned process
best_thetaEst = LeastSquares(3,2,pole,time); 


 