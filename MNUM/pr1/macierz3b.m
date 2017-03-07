function [b] = macierz3b( n )
for i = 1:n
    if rem(i,2)==0
       b(i) =5/(4*i);
    else
        b(i)=0;
    end
end
b=b';
end

