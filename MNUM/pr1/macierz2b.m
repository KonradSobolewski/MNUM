function [b] = macierz2b( n )
for i = 1:n
 b(i) = 1 + 0.2*i;
end
b=b';
end

