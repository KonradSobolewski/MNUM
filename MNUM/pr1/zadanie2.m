function [  ] = zadanie2() %rysuje wykres od normy residumm dla równañ zad2
i=input('Ktora podpunkt');
k=input('Do ilu rownañ');
R=zeros(k,1); % alokacja pamieci
if i==1 %  w zaleznosci od wybranego przykladu z zadania 2 
    for licznik=1:k
        R(licznik,1)=gauss(macierz(licznik*20),macierz1b(licznik*20));
        % tworzy macierz rozwi¹zañ , powtarzana co 20 rownañ
    end
else if i==2
      for licznik=1:k
        R(licznik,1)=gauss(macierza2(licznik*20),macierz2b(licznik*20));
      end
else if i==3 
      for licznik=1:k
        R(licznik,1)=gauss(macierza3(licznik*20),macierz3b(licznik*20));
      end
   end
   end
   end
     plot(R)%rysuje wykres
end

