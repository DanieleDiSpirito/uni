% x -> vettore soluzione
% A -> matrice triangolarizzata
% b -> vettore termini noti dopo la triangolarizzazione

% Implementazione del metodo di eliminazione di Gauss con strategia di
% Pivoting Totale

function [x, A, b] = gauss_pt(A, b, solve)
    if nargin == 2
        solve = true;
    end
    n = length(b);
    x = zeros(n, 1);
    x1 = x;
    indice = 1:n;
    for k = 1:n-1
        [massimi_per_colonna, riga] = max(abs(A(k:n, k:n)));
        [~, colonna] = max(massimi_per_colonna);
        j = colonna + k - 1;
        i = riga(colonna) + k - 1; % l'indice fa riferimento al vettore A(k:n, k) che parte dalla posizione k
        if i ~= k
            A([i k],:) = A([k i],:);
            b([i k]) = b([k i]);
        end
        if j ~= k
            A(:, [j k]) = A(:, [k j]);
            indice([j k]) = indice([k j]);
        end
        for i = k+1:n
            A(i,k) = A(i,k) / A(k,k);
            b(i) = b(i) - A(i,k) * b(k);
            for j = k+1:n
                A(i,j) = A(i,j) - A(i,k) * A(k,j);
            end
        end
    end

    if solve == true
        if abs(A(n,n)) < eps
            error("La matrice A è singolare");
        end
        x1(n) = b(n) / A(n,n);
        for i = n-1:-1:1
            x1(i) = b(i);
            % for j = i+1:n x(i) = x(i) - A(i,j) * x(j); end
            x1(i) = x1(i) - A(i,i+1:n) * x1(i+1:n);
            if abs(A(i,i)) < eps
                error("La matrice A è singolare");
            end
            x1(i) = x1(i) / A(i,i);
        end

        for i = 1:n
            x(indice(i)) = x1(i);
        end
    end
end