function area = midpoint(f, a, b, n)
    h = (b-a)/n;
    area = 0;

    for i = 0:(n/2-1)
        area = area + f(a + (2*i + 1)*h);
    end
    area = area*2*h;
end