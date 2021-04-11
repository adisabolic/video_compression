function [encoded, decoded, avgLenAll, predictions, errors] = temporalEncoding(mov)
%TEMPORALENCODING Funkcija vrsi predikciju piksela u frame-u t pomocu piksela
%iz prethodnih frame-ova i enkodira niz gresaka pomocu Huffmanovog koda
% Predikcija intenziteta piksela je aritmeticka sredina intenziteta piksela iz prethodna dva frame-a 
encoded = mov;
encoded(1).cdata = cast(encoded(1).cdata, 'int16');
encoded(2).cdata = cast(encoded(2).cdata, 'int16');
predictions = encoded;
predictions(1).cdata = cast(predictions(1).cdata, 'uint8');
predictions(2).cdata = cast(predictions(2).cdata, 'uint8');

% Enkodiranje
for i = 3:length(mov)
    encoded(i).cdata = round((cast(mov(i-1).cdata, 'int16') + cast(mov(i-2).cdata, 'int16'))/2);
    encoded(i).cdata = cast(encoded(i).cdata, 'int16');
    predictions(i).cdata = cast(encoded(i).cdata, 'uint8');
    encoded(i).cdata = encoded(i).cdata - int16(mov(i).cdata);
end

errors = encoded;

% Dekodiranje
decoded = encoded;
for i = 3:length(encoded)
    decoded(i).cdata = round((decoded(i-1).cdata + decoded(i-2).cdata)/2) - encoded(i).cdata;
end

for i = 1:length(decoded)
    decoded(i).cdata = cast(decoded(i).cdata, 'uint8');
end

% Huffman kodiranje
huffmanCode = cell(1, length(encoded));
avgLenAll = 0;
for i = 1:length(encoded)
    img = encoded(i).cdata;
    symbols = unique(img(:));
    counts = histc(img(:), symbols);
    p = counts / sum(counts);
    
    [huffDict, avgLen] = huffmandict(symbols, p);
    avgLenAll = avgLenAll + avgLen;
    e = huffmanenco(img(:), huffDict);
    huffmanCode{1, i} = e(:);
end
avgLenAll = avgLenAll / length(encoded);
encoded = huffmanCode;
    
    


