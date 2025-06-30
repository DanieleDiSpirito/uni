function x = indietro(A, b)
    n = length(b);
    x = zeros(n, 1);
    if abs(A(n,n)) < eps
        error("La matrice A è singolare");
    end
    x(n) = b(n) / A(n,n);
    for i = n-1:-1:1
        x(i) = b(i);
        % for j = i+1:n x(i) = x(i) - A(i,j) * x(j); end
        x(i) = x(i) - A(i,i+1:n) * x(i+1:n);
        if abs(A(i,i)) < eps
            error("La matrice A è singolare");
        end
        x(i) = x(i) / A(i,i);
    end
end