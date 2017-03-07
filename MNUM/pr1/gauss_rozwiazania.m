function [wyjscie] = gauss_rozwiazania( A,b )
n=length(b);
y = zeros(size(A,2),1);%alokacja miejsca dla rozwi¹zañ
x=[A,b];
for i=1:n-1 %
    ffddsdsszukam najwiekszego elementu w danej kolumnie
    w=abs(x(i,i));
    for j=i+1:n
       if w<abs(x(j,i))
           w=abs(x(j,i));
           temp=j;
       end
    end
    if w~=abs(x(i,i))
        
       z=x(temp,:);  % jesli znajde to zamieniam wiersze
       x(temp,:)=x(i,:);
       x(i,:)=z;
    end
       for j=i+1:n % zeruje pod przek¹tn¹
           x(j,:)=x(j,:)-(x(j,i)/x(i,i))*x(i,:);
       end
end

for n = size(A, 2):-1:1 % od ostatniego wiersza do pierwszego
    s = 0;
    %sumowanie wartosci na prawo od wartosci na diagonali w danej kolumnie
    for m = n + 1:size(A, 2) %for2
        s = s + x(n, m)*y(m);
    end 
    %rozwiazania
    y(n) = (x(n,size(A,2)+1) - s)/x(n,n);
   
end %for1
   q=A*y-b; %bl¹d rozwiazañ 
   res=0;
    for n=1:size(A,2)
        res=res+(q(n)^2); %norma residuum
    end
   res=sqrt(res);
   res
   wyjscie=y;

    return
end
