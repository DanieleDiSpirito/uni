function x = avanti(A, b)
    n = length(b);
    x = zeros(n, 1);
    if abs(A(1,1)) < eps
        error("La matrice A è singolare");
    end
    x(1) = b(1) / A(1,1);
    for i = 2:n
        x(i) = b(i) - A(i,1:i-1) * x(1:i-1);
        if abs(A(i,i)) < eps
            error("La matrice A è singolare");
        end
        x(i) = x(i) / A(i,i);
    end
end