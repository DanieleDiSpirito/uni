function counter = contaZeri(vec)
    counter = 0
    for i = 1:size(vec, 2)
        if vec(i) == 0
            counter = counter + 1
        end
    end
end