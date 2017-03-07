function [ Q, R ] = macierzR( A )
%QRmGS wyznacza rozklad QR (waski) zmodyfikowany algorytmem Grama-Schmidta
%dla macierzy mxn (m>=n) o pelnym rzedzie, rzeczywistej lub zespolonej
[m ,n] = size(A);
Q = zeros(m,n);
R = zeros(n,n);
d = zeros(1,n);
%rozklad z kolumnami Q ortogonalnym (nie ortonormalnymi)
for i=1:n
 Q(:,i) = A(:,i);
 R(i,i) = 1;
 d(i) = Q(:,i)'*Q(:,i);
 for j=i+1:n
 R(i,j)= (Q(:,i)'*A(:,j))/d(i);
 A(:,j) = A(:,j)-R(i,j)*Q(:,i);
 end
end
%normowanie rozkladu (kolumny Q ortonormalne)
for i=1:n
 dd = norm(Q(:,i));
 Q(:,i) = Q(:,i)/dd;
 R(i,i:n) = R(i,i:n)*dd;
end

