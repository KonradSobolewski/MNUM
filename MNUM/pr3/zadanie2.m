function [ roots ] = zadanie2( x, n )
%metoda Mullera MM2 dla -x^4-7*x^3+7*x^2+3*x+9
% x - punkt startowy
% n - liczba kroków
roots=(n:1); %wektor z miejscem zerowym funkcji z kazdej iteracji
for i = 1:n
      z1 = -2*(-x^4-7*x^3+7*x^2+3*x+9)/((-4*x^3-21*x^2+14*x+3)+sqrt(((-4*x^3-21*x^2+14*x+3)^2)-2*(-x^4-7*x^3+7*x^2+3*x+9)*(-12*x^2-42*x+14)));
      z2 = -2*(-x^4-7*x^3+7*x^2+3*x+9)/((-4*x^3-21*x^2+14*x+3)-sqrt(((-4*x^3-21*x^2+14*x+3)^2)-2*(-x^4-7*x^3+7*x^2+3*x+9)*(-12*x^2-42*x+14)));
      % wybieram alement o mniejszej wartoœci bezwzglêdnej mianownika
     if abs(((-4*x^3-21*x^2+14*x+3)+sqrt(((-4*x^3-21*x^2+14*x+3)^2)-2*(-x^4-7*x^3+7*x^2+3*x+9)*(-12*x^2-42*x+14)))) > abs(((-4*x^3-21*x^2+14*x+3)-sqrt(((-4*x^3-21*x^2+14*x+3)^2)-2*(-x^4-7*x^3+7*x^2+3*x+9)*(-12*x^2-42*x+14))));
         zmin = z1;
     else
         zmin = z2;
     end
     roots(i) = x+zmin;
     x = x+zmin;
end
end
