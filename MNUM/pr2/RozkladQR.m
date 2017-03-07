function [A]=RozkladQR(D,tol,imax,v,z)
% Sobolewski Konrad 2AR
% Funkcje obliczanie wartosci wlasnych na podstawie skryptu
% D - macierz
% tol - tolerancja (górna granica warto?ci) elementów zerowanych
% imax - maksymalna liczba iteracji
% A - wektor wartosci wlasnych
% iteracje - liczba wykonanych iteracji algorytmu
% v - Symetryczna(1) czy niesymeryczna(2)
% z - QR bez przesuniec(1) czy z przesunieciami(2)
blad=0;
if det(D)~=0 % sprawdzam czy nie jest osobliwa
          if v==1
                  D=(D+D');
          elseif v==2
                  D;
          end
    n=size(D,1); %rozmiar macierzy
    if z==1 %algorytm bez przesuniêæ
          i=1;
          iteracje=0;
          while i <= imax && max(max(D-diag(diag(D)))) > tol
                [Q1,R1] = macierzR(D);
                D=R1*Q1;%macierz przeksztalcona
                i=i+1;
                iteracje = iteracje + 1;
          end
          if i> imax
               % error('i wykracza poza maksymaln¹ iloœæ iteracji');
                blad=1;
          end
          A=diag(D);

    elseif z==2
          A=diag(zeros(n)); %alokacja pamieci na wartosci wlasne
          INITIALsubmatrix=D;
          iteracje=0;
          for k=n:-1:2
                DK=INITIALsubmatrix(1:k,1:k);  %macierz poczatkowa dla wyznaczenia 
                i=0;
                while i <= imax && max(abs(DK(k,1:k-1))) > tol
                       DD=DK(k-1:k,k-1:k);
                       %oblicza pierwiastki wielomianu kwadratowego w celu
                       %wyznaczenie pierwiastka zerowego 
                       ev = roots([1, -(DK(k-1,k-1)+DK(k,k)), DK(k-1,k-1)*DK(k,k)-DK(k,k-1)*DK(k-1,k)]);
                       if abs(ev(1)-DK(k,k)) <= abs(ev(2)-DK(k,k))
                            shift=ev(1); %przesuniecie
                       else
                            shift=ev(2); %przesuniecie
                       end
                       DK=DK-eye(k)*shift; %macierz przesunieta
                       [Q1,R1] = macierzR(DK);
                       DK=R1*Q1+eye(k)*shift; %macierz przeksztalcona
                       i=i+1;
                       iteracje = iteracje + 1;
                end
                if i> imax
                   % error('i wykracza poza maksymaln¹ iloœæ iteracji');
                    blad=1;
                end
                A(k)=DK(k,k);
                if k>2 
                    INITIALsubmatrix=DK(1:k-1,1:k-1); %deflacja macierzy
                else 
                    A(1)= DK(1,1); %ostatnia wartosc wlasna
                end   
          end
     end
else 
    %error('macierz jest osobliwa');
    blad=1;
end
end

                
        
