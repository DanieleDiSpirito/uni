function area = trapezi(f, a, b, n)
    h = abs(b-a) / n;
    area = 0;
    for i = 0:n-1
        area = area + h/2 * (f(a + i*h) + f(a + (i+1)*h));
    end
end