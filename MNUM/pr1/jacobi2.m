function [ wyjscie ] = jacobi2(A, b) % liczy wyniki i bl¹d dla zad3 i 2
L=input('Ile iteracji');
z=input('Bl¹d(1) czy rozwiazanie(2)');
    if (size(A, 1) ~= size(A, 2))
        error('Macierz A nie jest kwadratowa')
    end
    %alokacja pamieci dla zmiennych
    x = zeros(size(A,2), 1);
    w = zeros(size(A,2), 1);
    res = zeros(L,1);
    blad = zeros(L,1);
    
    for n = 1:size(A, 2)
        w(n) = A(n, n); %wektor dla diagonali
    end 
    
    %utworzenie rozbicia macierzy na macierz D i L+U
    D = diag(w);
    M = A - D;
    D=inv(D);
    
    %wykonanie danej ilosci iteracji z ktorych kazda zwieksza
    %dokladnosc wyniku
    for n = 1:L
        x = -D*M*x + D*b ;
        res = A*x-b;
     
        temp=0; % licze blad dla ka¿dej iteracji (norma residuum)
        for i=1:size(A,1)
             temp=temp + (res(i,1))^2; 
        end
        temp=sqrt(temp);
        blad(n,1)=temp;
        if temp<=eps %warunek opuszczenia pêtli 
            break
        end
    end 
    plot(blad)
if (z==1)
wyjscie=temp;
else if (z==2)
wyjscie=x;
else
error('Blad danych')
    end
end
end

