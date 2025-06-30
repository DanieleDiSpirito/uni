function posizione_min = trova_minimo(vect, dim)
    posizione_min = 1;
    min = vect(posizione_min);
    for i = 2:dim
        if vect(i) < min
            min = vect(i);
            posizione_min = i;
        end
    end
end