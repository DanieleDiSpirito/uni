% x  = [-4, -3, -1, 0, 3, 5];
% fx = [1, -2, 3, 0, 2, -1];
% minx = min(x);
% maxx = max(x);
% miny= min(fx);
% maxy = max(fx);
% 
% hold on;
% f = @(x) sin(x.^2) - 1;
% xx = linspace(minx - 1, maxx + 1, 100);
% y = f(xx);
% plot(xx, y, "m");
% 
% x1 = [-2, 2];
% fx1 = f(x1);
% yy1 = lagrange(x1, fx1, xx);
% plot(xx, yy1);
% x2 = [-2, 0, 2];
% fx2 = f(x2);
% yy2 = lagrange(x2, fx2, xx);
% plot(xx, yy2);
% x3 = [-2, -1, 1, 2];
% fx3 = f(x3);
% yy3 = lagrange(x3, fx3, xx);
% plot(xx, yy3);
% x4 = [-2, -1, 0, 1, 2];
% fx4 = f(x4);
% yy4 = lagrange(x4, fx4, xx);
% plot(xx, yy4);
% 
% plot(x4, fx4, "ro");
% grid off;
% xlim([minx-1, maxx+1]);
% miny = min([min(yy1), min(yy2), min(yy3), min(yy4)]);
% maxy = max([max(yy1), max(yy2), max(yy3), max(yy4)]);
% ylim([miny, maxy+100]);

[xx, yy, fxx, err] = runge(-3, 3, 11);
tiledlayout(2,1)
ax1 = nexttile;
plot(xx, yy);
hold on;
plot(xx, fxx);
ax2 = nexttile;
plot(xx, err);
