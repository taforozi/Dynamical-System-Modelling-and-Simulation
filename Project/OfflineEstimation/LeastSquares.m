function theta_est = LeastSquares(n,m,pole,time)

y = out(time,u(time));

% linear parameterization 
% To use the LS method we have to guarantee that the parameters appear in a linear form
[zeta,lambda] = parameterization(n,m,pole,time,y);

thetaL = (y'*zeta)/(zeta' * zeta);
theta_est = zeros(1,n+m+1);

for k = 1:n+m+1
    if k <= n % only for theta1 star
        theta_est(k) = thetaL(k) + lambda(k+1);
    else
        theta_est(k) = thetaL(k);
    end
end

end