function [VcRealError,VrRealError, Vout] = getVsignals(time,flag)

l = length(time);

VrRealError = zeros(length(time),1);
VcRealError = zeros(length(time),1);
for i = 1:length(time)
    Vout = v(time(i));
    VrRealError(i) = Vout(2);
    VcRealError(i) = Vout(1);
end

% in case we want to get wrong values in order to observe the model's
% behaviour
if (flag == 1)
% random values between 500 and 1500
a = 500;
b = 1500;

% randi(l) generates a random integer between 1 and l (length of the time matrix)
 for i=1:3 
     VcRealError(randi(l)) = (b-a)*rand() + a;
     VrRealError(randi(l)) = (b-a)*rand() + a;
 end
end

end