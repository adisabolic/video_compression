function result = RMSE(A, B)
%RMSE funkcija racuna RMSE (root mean squared error) izmedju dvije matrice
%A i B
result = (A-B).^2;
result = mean(result(:));
result = sqrt(result);
end

