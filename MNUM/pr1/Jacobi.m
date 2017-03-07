function [ x ] = Jacobi( A, b)
    n=size(A,2); %wczytujemy rozmiar
    x=zeros(n,1);
    D=zeros(n);
    L=zeros(n);
    U=zeros(n);
    for i=1:n
       if (sum(abs(A(1:i-1,i)))+sum(abs(A(i+1:n,i))))<=abs(A(i,i)) || (sum(abs(A(i,1:i-1)))+sum(abs(A(i,i+1:n))))<=abs(A(i,i)) %sprawdzamy czy zachodziwarunek konieczny
           for j=1:n
               if i==j
                   D(i,i)=A(i,i); % macierz D
               end
               if i>j
                   L(i,j)=A(i,j); %  macierz L
               end
               if i<j
                   U(i,j)=A(i,j); % macierz U
               end
           end
       else
           error('Blad danych. BRAK SILNEJ DOMINACJI')
       end
    end
    while abs(A*x-b)>eps
        x=D\(b-(L+U)*x);
    end
end