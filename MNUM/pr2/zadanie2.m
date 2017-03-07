function [wynik] = zadanie2(n)
% Sobolewski Konrad 2AR
% tworze macierz potêg a nastepnie wybieram jedn¹ z dwoch metod 
% do obliczenia wspo³czynnikow,rysuje wykres a na koñcu obliczam b³¹d
% residuum po zsumowaniua poszczegolnych elementów macierzy ax 

x=[-5,-4,-3,-2,-1,0,1,2,3,4,5]';
y=[-32.9591,-20.7011,-12.6986,-5.1508,-1.6893,0.1266,0.743,-0.8709,-1.7371,-3.9952,-4.8987]';
% n - zadany stopien wielomianu-1
% a - wektor wspolczynnikow funcji
v=input('QR(1) czy Rownan Normalnych(2)');
[m,~] = size(x); %pobranie rozmiaru macierzy x
A = zeros(m,n);

for i=1:m %wiersze
      for j=1:n %kolumny
           A(i,j)=x(i)^(j-1); %wypelniamy odpowiednimi wartosciami potegi x
      end
end
      if v==1 %wybor metody 
          [Q,R]=macierzR(A);
          a = inv(R)*(Q'*y);
      elseif v==2
          a = inv(A'*A)*(A'*y);
      else
          error('metoda nie wybrana');
      end
      fx=0;
      d=[-5:0.1:5];
      for i=1:n %funkcja zaaproksymowana 
          fx= fx + a(i,1)*d.^(i-1);
      end
      plot(d,fx);
res = zeros(m,1);
%obliczanie reszt
for i=1:m
      suma = 0;
      for j=1:n
              suma = suma + a(j)*x(i)^(j-1); % suma a*x^potega
      end
      res(i) = y(i) - suma;
end
residuum = norm(abs(res),Inf);%oblicza norme residuum
c=input('Rozwi¹zanie(1) czy residuum(2)');
if c==1
    wynik=a;
elseif c==2
    wynik=residuum;
else
    error('Blad danych');
end
end
