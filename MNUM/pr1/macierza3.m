function [A]=macierza3(n)
%utworzenie macierzy i wektora dla zadania 2 a)
%alokacja pamieci
b = zeros(n, 1);
A = zeros(n, n);
for i = 1:n
    for j=1:n
      A(i,j) = 3/(5*(i+j+1));
    end
end
end
