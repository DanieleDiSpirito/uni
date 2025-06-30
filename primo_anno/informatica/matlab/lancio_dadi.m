function lancio_dadi(n_times)

n_times = str2num(n_times);
time = 1;

start(6) = 6;
for i = 1:5
    start(i) = i;
end

res = start;

while(time < n_times)
    res(6*(time + 1)) = 0;

    i = 1;
    for n = 1:6
        for j = 1:6^time
            res(i) = start(j) + n;
            i = i + 1;
        end
    end

    start = res;
    time = time + 1;
end

histogram(res, n_times:6*n_times+1);
end