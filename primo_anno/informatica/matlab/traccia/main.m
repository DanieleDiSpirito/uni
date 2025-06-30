function main()

flag = 1;
while flag
    dim = input('Inserisci il numero di elementi: ');
    flag = (dim <= 0);
end

vect = carica_vett(dim);
media = media_vett(vect, dim);
[el_minori, el_minori_dim] = trova_elementi_minori(vect, dim, media);
posizione_min = trova_minimo(vect, dim);

fprintf("Media valori: %d\n", media);
fprintf("Elementi minori della media:\n");
for i = 1:el_minori_dim
    fprintf("\t- Elemento in posizione %d: %d\n", el_minori(i), vect(el_minori(i)));
end
fprintf("Minore trovato in posizione %d: %d\n", posizione_min, vect(posizione_min));
end