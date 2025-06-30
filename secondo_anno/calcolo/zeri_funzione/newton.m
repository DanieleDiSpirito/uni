function [alpha, nIter] = newton(x0, f, df, eps)
    nIter = 0;
    r = 1; % molteplicità
    fx0 = f(x0);
    dfx0 = df(x0);
    if abs(dfx0) < eps
        error("Division per zero");
    end
    x1 = x0 - r * fx0 / dfx0;
    fx1 = f(x1);
    % interval = linspace(-10, 10, 100); % plotting
    % t = @(x) fx0 + dfx0 * (x - x0); % plotting
    % tx = t(interval); % plotting
    % plot(interval, tx, "red") % plotting
    while abs(x1 - x0) > eps || abs(fx1) > eps
        x0 = x1;
        fx0 = fx1;
        dfx0 = df(x0);
        if abs(dfx0) < eps^r
            error("Divisione per zero");
        end
        x1 = x0 - r *  fx0 / dfx0;
        % t: y - fx0 = dfx0 (x - x0) => t: y = fx0 + dfx0 (x - x0)
        % t = @(x) fx0 + dfx0 * (x - x0); % plotting
        % tx = t(interval); % plotting
        % plot(interval, tx, "red") % plotting
        fx1 = f(x1);
        nIter = nIter + 1;
    end
    alpha = x1;
end