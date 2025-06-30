function yy = lagrange(x,fx,xx)
    n = length(x);
    n1 = length(fx);
    if n ~= n1
        error("I punti non coincidono");
    end
    m = length(xx);
    yy = zeros(m,1);
    for j = 1:m
        for k = 1:n
            yy(j) = yy(j) + fx(k) * prod((xx(j) - x([1:k-1,k+1:n]))./(x(k) - x([1:k-1,k+1:n])));
        end
    end
end