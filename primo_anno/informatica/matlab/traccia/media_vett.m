function media = media_vett(vect, dim)
    somma = 0;
    n_pari = 0;
    for i = 2:2:dim
        somma = somma + vect(i);
        n_pari = n_pari + 1;
    end
    media = somma / n_pari;
end