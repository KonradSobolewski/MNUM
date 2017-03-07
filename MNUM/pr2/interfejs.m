function [  ] = interfejs()
loops=30;
sumaiter=0;
udaneiter=0;
rozmiar=0;
srednia=0;
blads=0;
iter=0;
a=input('macierz 5x5(1) , macierz 10x10(2),macierz 20x20(3)');
b=input('symetryczna(1),niesymetryczna(2)');
c=input('bezprzesuniec(1),z przesunieciami(2)');
if a==1 
    rozmiar=5;
    for i=1:loops
        [A,iter,blads]=RozkladQR(rand(5,5),0.00001,1000,b,c);
        sumaiter=sumaiter+iter;
        if blads==0
            udaneiter=udaneiter+1;
        end
    end
    srednia=sumaiter/loops;
    fprintf(1, 'Rozmiar macierzy: %d\n', rozmiar);
     if b==1
          fprintf(1, 'Macierz symetryczna\n');
     elseif b==2
          fprintf(1, 'Macierz niesymetryczna\n');
     else
         error('Brak danych');
     end
     if c==1
          fprintf(1, 'Macierz bezprzesuniec\n');
     elseif c==2
          fprintf(1, 'Macierz z przesunieciami\n');
     else
         error('Brak danych');
     end
     
     fprintf(1, 'Srednia ilosc iteracji: %g\n', srednia);
     fprintf(1, 'Udane wykonania: %d z %d\n', udaneiter, loops);
elseif a==2
     rozmiar=10;
     for i=1:loops
        [A,iter,blads]=RozkladQR(rand(10,10),0.00001,1000,b,c);
        sumaiter=sumaiter+iter;
        if blads==0
            udaneiter=udaneiter+1;
        end
     end
     srednia=sumaiter/loops;
      fprintf(1, 'Rozmiar macierzy: %d\n', rozmiar);
     if b==1
          fprintf(1, 'Macierz symetryczna\n');
     elseif b==2
          fprintf(1, 'Macierz niesymetryczna\n');
     else
         error('Brak danych');
     end
     if c==1
          fprintf(1, 'Macierz bezprzesuniec\n');
     elseif c==2
          fprintf(1, 'Macierz z przesunieciami\n');
     else
         error('Brak danych');
     end
     
     fprintf(1, 'Srednia ilosc iteracji: %g\n', srednia);
     fprintf(1, 'Udane wykonania: %d z %d\n', udaneiter, loops);
elseif a==3
     rozmiar=20;
     for i=1:loops
        [A,iter,blads]=RozkladQR(rand(20,20),0.00001,1000,b,c);
        sumaiter=sumaiter+iter;
        if blads==0
            udaneiter=udaneiter+1;
        end
     end
     srednia=sumaiter/loops;
     fprintf(1, 'Rozmiar macierzy: %d\n', rozmiar);
     if b==1
          fprintf(1, 'Macierz symetryczna\n');
     elseif b==2
          fprintf(1, 'Macierz niesymetryczna\n');
     else
         error('Brak danych');
     end
     if c==1
          fprintf(1, 'Macierz bezprzesuniec\n');
     elseif c==2
          fprintf(1, 'Macierz z przesunieciami\n');
     else
         error('Brak danych');
     end
     fprintf(1, 'Srednia ilosc iteracji: %g\n', srednia);
     fprintf(1, 'Udane wykonania: %d z %d\n', udaneiter, loops);
else
    error('Brak danych');

end
end

