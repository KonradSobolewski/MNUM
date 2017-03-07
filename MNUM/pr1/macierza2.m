function [A]=macierza2(n)
%utworzenie macierzy i wektora dla zadania 2 a)
%alokacja pamieci
b = zeros(n, 1);
A = zeros(n, n);
for i = 1:n
     A(i,i) = 1/8;
    for j=1:n
        if i~=j
      A(i,j) = 3*(i-j)+2;
        end
    end
end
A(n,n) = 1/8; %ostatni element na diagonali macierzy

end
