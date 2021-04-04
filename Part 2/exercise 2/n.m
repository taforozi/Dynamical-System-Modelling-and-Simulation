function noise = n(t)

n0 = 0.15;
f = 20;

noise = n0*sin(2*pi*f*t);

end