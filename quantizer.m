function MSEn = quantizer(n)
    ts = 1/18000;
    T = 0.1;
    t = 0:ts:T;
    Y = signal(t);
    Ay = max(Y) - min(Y);
    sL = Ay/(2^n);
    L = 0;
    MSEn = 0;
    for j=1:(2^n)
        for i=1:max(size(Y))
            if abs(Y(i)) >= L
                if abs(Y(i)) <= (L+sL)
                    Y_n(i) = sign(Y(i))*L;
                    MSEn = MSEn + (Y_n(i) - Y(i))^2;
                end
            end
        end
        L = L + sL;
    end
    
    MSEn = MSEn/max(size(MSEn))
    figure(1);
    hold on;
    plot(t,Y_n);
    plot(t,Y)
    title('Quantizador de n bits');
end