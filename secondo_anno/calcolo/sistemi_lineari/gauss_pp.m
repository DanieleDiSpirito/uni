% x -> vettore soluzione
% A -> matrice triangolarizzata
% b -> vettore termini noti dopo la triangolarizzazione

% Implementazione del metodo di eliminazione di Gauss con strategia di
% Pivoting Parziale

function [x, A, b] = gauss_pp(A, b, solve)
    if nargin == 2
        solve = true;
    end
    n = length(b);
    x = zeros(n, 1);
    for k = 1:n-1
        [~, i] = max(abs(A(k:n, k)));
        i = i+k-1; % l'indice fa riferimento al vettore A(k:n, k) che parte dalla posizione k
        if i ~= k
            A([i k],:) = A([k i],:);
            b([i k]) = b([k i]);
        end
        if abs(A(k,k)) < eps
            error('La matrice A è singolare');
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