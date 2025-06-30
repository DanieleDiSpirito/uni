function [alpha, nIter] = bisezione(f, a, b, eps)
    nIter = 0;
    if nargin == 3
        eps = 1e-8;
    end
    fa = f(a);
    fb = f(b);
    if fa*fb > 0
        error("Intervallo non contenente uno zero!");
    end
    while b - a > eps || abs(fc) > eps % entrambi i criteri devono essere rispettati
        c = (a + b) / 2;
        fc = f(c);
        if fc*fa < 0
            b = c;
        else
            a = c;
        end
        % xline(a); % plotting
        % xline(b); % plotting
        nIter = nIter + 1;
    end
    alpha = c;
end