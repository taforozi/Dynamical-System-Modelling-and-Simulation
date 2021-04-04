function [zeta,lambda] = parameterization(n,m,pole,time,y)
syms s
    
delta_y = cell(1,n); % Än-1(s)' 
for i = 1:1:n % create [s^(n-1) s^(n-2) ... s^2 s 1] for y
    delta_y{i} = sym2poly(s^(n-i));
end

delta_u = cell(1,m+1); % Äm(s)'
for i = 1:m+1 % create [s^m s^(m-1) ... s^2 s 1] for u
    delta_u{i} = sym2poly(s^(m+1-i));
end

% Create filter - Filter's order = Output order = n
L = (s + pole)^n; % Ë(s)
L = expand(L);
lambda = sym2poly(L); % [1 ë1 ë2...ën]'

zeta1 = cell(1,n); % æ1 = -Ä/Ë(s) for y
for i = 1:1:n 
    zeta1{i} = tf(-delta_y{i},lambda);
end

zeta2 = cell(1,m+1); % æ2 = Ä/Ë(s) for u
for i = 1:1:m+1  
    zeta2{i} = tf(delta_u{i},lambda);
end

%% Regression vector æ
zeta = zeros(length(time),n+m+1);
for j = 1:n+m+1 % einai ousiastika to Ö
   if j <= n
       zeta(:,j) = lsim(zeta1{j},y,time);
   else
       zeta(:,j) = lsim(zeta2{j-n},u(time),time); %j-n-1+1
   end
end

end