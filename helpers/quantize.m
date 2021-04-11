function result = quantize(x, b)
%QUANTIZE Kvantizira elemente proslijedjene UINT8 matrice.
%   result = QUANTIZE(X, B) kvantizira elemente matrice X na B bita, tako sto sacuva samo
%   najviših B bita svakog elementa iz X.
low = uint8(2^(8-b)-1);
high = uint8(2^8-double(low)-1);

result = bitand(x, high);
end

