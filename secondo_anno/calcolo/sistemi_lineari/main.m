A = [1 2 -1 0; 2 -1 -1 1; 3 0 -1 1; 1 -3 1 1];
b = [2; 1; 4; 2];

[~, A_triangolarizzata, b_triangolarizzata] = gauss(A, b, false);
fprintf("Triangolarizzazione senza Pivoting\n");
disp(A_triangolarizzata);
disp(b_triangolarizzata);

fprintf("Triangolarizzazione con Pivoting Parziale\n");
[~, A_triangolarizzata, b_triangolarizzata] = gauss_pp(A, b, false);
disp(A_triangolarizzata);
disp(b_triangolarizzata);

fprintf("Risoluzione all'indietro\n");
x = indietro(A_triangolarizzata, b_triangolarizzata);
disp(x);

A2 = [1/4 0 0 0; -1/5 4/5 0 0; 1 1 -5 0; 0 -1 2 1]; % triangolare inf
b2 = [1; 8/5; -3; 2];

fprintf("Risoluzione in avanti\n");
y = avanti(A2, b2);
disp(y);

fprintf("Risoluzione Gauss (senza pivoting)\n");
[x, A1, b1] = gauss(A, b);
disp(A1); % triangolare sup
disp(b1);
disp(x);

fprintf("Risoluzione Gauss (con pivoting parziale)\n");
[x, A2, b2] = gauss_pp(A, b);
disp(A2); % triangolare sup
disp(b2);
disp(x);

fprintf("Risoluzione Gauss (con pivoting totale)\n");
[x, A3, b3] = gauss_pt(A, b);
disp(A3); % triangolare sup
disp(b3);
disp(x);

A4 = [1 1 2 1 0; 2 1 3 1 -4; -1 -1 -2 3 0; 4 2 1 1 0; 5 2 -2 1 7];
b4 = [1 3 4 2 5];
[x, A5, b5] = gauss_pt(A4, b4);
disp(A5); % triangolare sup
disp(b5);
disp(x);

fprintf("----------------------------------\n\n");

A = [1/2 1 0; 1 3 -2; 0 -2 0];
b = [3; 4; 5];

[L, U, b] = fatt_LU(A, b, false);

y = avanti(L, b); % Ly = b
x = indietro(U, y); % Ux = y

fprintf("Soluzione con fattorizzazione LU:\n\n");
disp(x);

[x, A, b] = gauss_pt(A, b, true);
fprintf("Soluzione con Gauss:\n\n");
disp(x);
