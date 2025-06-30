f = @(x) 1-x.^2;
F = @(x) x - x.^3 ./ 3;

x = linspace(-3, 3, 100);
fx = f(x);
plot(x, fx);

n = 10;
area = trapezi(f, -3, 3, n);
area2 = cavalieri(f, -3, 3, n);
area3 = midpoint(f, -3, 3, n);

fprintf("Area effettiva: %f\n", F(3) - F(-3));
fprintf("Formula dei trapezi composta in %i intervalli: %f\n", n, area);
fprintf("Formula di Cavalieri-Simpson composta in %i intervalli: %f\n", n, area2);
fprintf("Formula del Midpoint composta in %i intervalli: %f\n", n, area3);