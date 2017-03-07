function [ x ] = zadanie1(a,b,n,metoda,epsi)
%ZNAJDZZERO szuka miejsce zerowe funkcji
% a - poczatek przedzialu
% b - koniec przedzialu
% n - limit iteracji
% epsilon - wymagana dokladnosc
% method - metoda
% x - wektor wyznaczonej wartosci x w kazdej iteracji
% y - wektor przyblizen miejsca zerowego funkcji
% iter - licznik iteracji
iter = 0; %licznik iteracji
y=zeros(n,1);
x=zeros(n,1);
for i=1:n
    iter = iter+1;
    if metoda==1  %bisekcja
        c = (a+b)/2; %srodek przedzialu
        %c zastepuje te granice przedzialu, ktora jest tego samego znaku
        if (3.1-3*c-exp(-c))*(3.1-3*a-exp(-a)) < 0
             b=c;
        elseif (3.1-3*b-exp(-b))*(3.1-3*c-exp(-c)) < 0
             a=c;
        end
        %wynikiem iteracji jest ta granica przedzialu, dla ktorej
        %funkcja przyjmuje mniejsza wartosc
        if abs(3.1-3*a-exp(-a)) < abs(3.1-3*b-exp(-b))
             x(i)=a;
        else
             x(i)=b;
        end
    elseif metoda==2 %siecznych
          c = b-(((3.1-3*b-exp(-b))*(b-a))/((3.1-3*b-exp(-b))-(3.1-3*a-exp(-a))));
          %zastapienie wartosci z poprzednich krokow
          a=b;
          b=c;
          %wynikiem iteracji jest ten krok, dla ktorej funkcja przyjmuje mniejsza wartosc
          if abs((3.1-3*a-exp(-a))) < abs((3.1-3*b-exp(-b)))
             x(i)=a;
          else
             x(i)=b;
          end
    elseif metoda==3 %newton 
              %c - przeciecie stycznej do funkcji w punkcie a z osia x
              c=a-(3.1-3*a-exp(-a))/(-3+exp(-a));
              %c staje sie wybranym punktem w nastepnym kroku
            a=c;
            x(i)=a;
      else
              error('brak wybranej metody');
      end
      y(i)=(3.1-3*x(i)-exp(-x(i)));
      %warunek stopu
      if abs(y(i))<=epsi
          break;
      end
   end
end
