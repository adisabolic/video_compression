function result = sizeMB(x, b)
%sizeMB Vraca broj MB potrebnih sa spremanje niza frame-ova x na disk, ako se za svaki
%piksel koristi b bita
n = length(x);
result = n * size(x(1).cdata, 1) * size(x(1).cdata, 2) * b;
if length(size(x(1).cdata)) == 3
    result = result * 3;
end
result = result / 8388608;
end

