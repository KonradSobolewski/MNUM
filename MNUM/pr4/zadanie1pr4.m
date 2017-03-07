function [] = zadanie1pr4(ile,x1,x2)
%funkcja s³u¿y do wyliczenia b³êdu
%obliczenie rozwiazania za pomoca metody RK4
[Y1,Y2]=metodark2(ile,x1,x2);
%obliczenie rozwiazania metoda KD4 o polowicznym kroku (do oszacowania
%bledu)
[Y3,Y4]= metodark2(2*ile,x1,x2);
for i=1:size(Y1,2)-1 % obliczam b³ad dla tego samego kroku
     Error1(:,i) =abs(Y1(:,i)-Y3(:,2*i));
     Error2(:,i) =abs(Y2(:,i)-Y4(:,2*i));
end
plot(Error2);

end