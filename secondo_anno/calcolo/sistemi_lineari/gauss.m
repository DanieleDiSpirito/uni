% x -> vettore soluzione
% A -> matrice triangolarizzata
% b -> vettore termini noti dopo la triangolarizzazione

function [x, A, b] = gauss(A, b, solve)
    if nargin == 2
        solve = true;
    end
    n = length(b);
    x = zeros(n, 1);
    for k = 1:n-1
        if abs(A(k,k)) < eps
            error('Elemento pivotale nullo');
        end
        for i = k+1:n
            A(i,k) = A(i,k) / A(k,k);
            b(i) = b(i) - A(i,k) * b(k);
            for j = k+1:n
                A(i,j) = A(i,j) - A(i,k) * A(k,j);
            end
            A(i,k) = 0;
        end
    end

    if solve == true
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
end