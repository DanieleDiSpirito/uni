function [el_minori, el_minori_dim] = trova_elementi_minori(vect, dim, media)
    el_minori_dim = 0;
    for i = 1:dim
        if(vect(i) < media)
            el_minori_dim = el_minori_dim + 1;
            el_minori(el_minori_dim) = i;        
        end
    end
end