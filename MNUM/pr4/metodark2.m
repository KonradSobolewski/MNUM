function []= metodark2(ile,war1,war2)
%ile- na ile punktow dzielimy przedzial
skok=20/ile;
x1(1)=war1;
x2(1)=war2;
for i=1:(ile-1) % wyliczam wspó³czynniki 
k11=poch1(x1(i),x2(i));
k21=poch1(x1(i)+0.5*skok,x2(i)+0.5*k11*skok);
k31=poch1(x1(i)+0.5*skok,x2(i)+0.5*k21*skok);
k41=poch1(x1(i)+skok,x2(i)+skok*k31);
k12=poch2(x1(i),x2(i));
k22=poch2(x1(i)+0.5*skok,x2(i)+0.5*k12*skok);
k32=poch2(x1(i)+0.5*skok,x2(i)+0.5*k22*skok);
k42=poch2(x1(i)+skok,x2(i)+skok*k32);
x1(i+1)=x1(i)+skok*(k11+2*k21+2*k31+k41)/6; % nowe punkty 
x2(i+1)=x2(i)+skok*(k12+2*k22+2*k32+k42)/6;
end
plot(x1,x2);
end