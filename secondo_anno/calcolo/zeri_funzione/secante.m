function [zero, nIter] = secante(f, a, b, eps)
    nIter = 0;
    if nargin == 3
        eps = 1e-8;
    end
    fa = f(a);
    fb = f(b);
    if fa*fb > 0
        error("Intervallo non contenente uno zero!");
    end
    if abs(fa) < eps
        zero = a;
        return;
    end
    if abs(fb) < eps
        zero = b;
        return;
    end
    % Choice c as b
    x0 = a;
    c = b;
    fc = f(c);
    fx0 = f(x0);
    interval = linspace(a, b, 100); % plotting
    s = @(x) fx0 + (fc - fx0) * (x - x0) / (c - x0); % plotting
    sx = s(interval); % plotting
    plot(interval, sx, "yellow"); % plotting
    while abs(fx0) > eps
        x0 = x0 - fx0 * (x0 - c) / (fx0 - fc);
        xline(x0); % plotting
        fx0 = f(x0);
        % s: y = fx0 + (fc - fx0) * (x - x0) / (c - x0)
        s = @(x) fx0 + (fc - fx0) * (x - x0) / (c - x0); % plotting
        sx = s(interval);
        plot(interval, sx, "green"); % plotting
        if fc * fx0 > 0
            tmp = c;
            c = x0;
            x0 = tmp;
            tmp = fc;
            fc = fx0;
            fx0 = tmp;
        end
        nIter = nIter + 1;
    end
    zero = x0;
end