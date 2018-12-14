function Y = lei_u(y)
    u = 255;
    Y = sign(y).*log(1+u*abs(y))/log(1+u);
end