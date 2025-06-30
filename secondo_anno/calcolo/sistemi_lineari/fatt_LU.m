% x -> vettore soluzione
% A -> matrice triangolarizzata
% b -> vettore termini noti dopo la triangolarizzazione

function [L, U, b] = fatt_LU(A, b, solve)
    if nargin == 2
        solve = true;
    end
    n = length(b);
    x = zeros(n, 1);
    U = A;
    L = tril(ones(n));
    for k = 1:n-1
        if abs(A(k,k)) < eps
            error('Elemento pivotale nullo');
        end
        for i = k+1:n
            L(i,k) = U(i,k) / U(k,k);
            U(i,k) = U(i,k) / U(k,k);
            for j = k+1:n
                U(i,j) = U(i,j) - U(i,k) * U(k,j);
            end
            U(i,k) = 0;
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