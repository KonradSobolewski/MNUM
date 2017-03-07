function [X,Y] = projekt3()
iteracje = 10;
epsilon = 10^(-12);
metody = {'bisekcja'; 'sieczne'; 'newton'};
a = -5;
b = 10;
X = zeros(iteracje,3);
Y = zeros(iteracje,3);
for i=1:3
    %display(metody(i));
    [X(:,i),Y(:,i), ~] = zadanie1(a,b,iteracje,epsilon,metody(i));
end
end