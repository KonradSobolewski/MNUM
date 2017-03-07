function [A]=macierz(n)
%utworzenie macierzy i wektora dla zadania 2 a)
%alokacja pamieci
b = zeros(n, 1);
A = zeros(n, n);
for i = 1:n-1
 A(i,i) = 5; %diagonalna
 A(i,i+1) = 2; %po prawej od diagonalnej
 A(i+1, i) = 2; %pod diagonalna
end
A(n,n) = 5; %ostatni element na diagonali macierzy


end
