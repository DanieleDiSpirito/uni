function vect = carica_vett(dim)
    vect = zeros(1, dim);
    for i = 1:dim
        flag = 1;
        while flag
            vect(i) = input("Inserire l'elemento del vettore in posizione " + i + ": ");
            flag = (vect(i) < 0);
        end
    end
end