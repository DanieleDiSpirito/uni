function [xx, yy, fxx, err] = runge(a,b,n)
    f = @(x) 1 ./ (1 + x.^2);
    x = linspace(a, b, n);
    fx = f(x);
    m = 200;
    xx = linspace(a, b, m);
    fxx = f(xx);
    yy = zeros(m,1);
    for j = 1:m
        for k = 1:n
            yy(j) = yy(j) + fx(k) * prod((xx(j) - x([1:k-1,k+1:n]))./(x(k) - x([1:k-1,k+1:n])));
        end
    end
    err = abs(yy - fxx');
end