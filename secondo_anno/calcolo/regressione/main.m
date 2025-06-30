N = 5;

points = Point.empty(N, 0);
for i = 1:N
    points(i) = Point(rand(), rand());
end

hold on;
for i = 1:N
    plot(points(i).x, points(i).y, "x");
end

linear_regression = regression(points);
x = linspace(0, 1, 100);
fx = linear_regression(x);
plot(x, fx);