function result = huffCodeSizeMB(x)
%huffCodeSizeMB vraca ukupan broj MB koje zauzima niz huffmanovih kodova
%   Input x je niz huffmanovih kodova, pri cemu svaki znak zauzima jedan
%   bit (znak je 0 ili 1). Funkcija vraca koliko ukupno niz zauzima MB.
result = 0;
for i = 1:length(x)
    result = result + length(x{1, i});
end
result = result / 8388608;
end

