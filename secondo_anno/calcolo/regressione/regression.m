function f = regression(points)
    n = numel(points);
    X = sum([points.x]);
    Y = sum([points.y]);
    Q = sum([points.x].^2);
    S = sum([points.x].*[points.y]);
    den = Q*(n+1) - X^2;
    m = (S*(n+1) - X*Y) / den;
    q = (Q*Y - S*X) / den;
    f = @(x) m*x + q;
end