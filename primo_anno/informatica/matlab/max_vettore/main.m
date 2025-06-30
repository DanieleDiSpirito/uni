function main()

dim = input('Inserisci la dimensione del vettore: ');
vet = caricaVett(dim);
MAX = vet(1);
for i = 2:dim
    if MAX < vet(i)
        MAX = vet(i);
    end
end
fprintf('Massimo: %g\n', MAX);
% Stampo ogni elemento del vettore
stampaVett(vet, dim);

end