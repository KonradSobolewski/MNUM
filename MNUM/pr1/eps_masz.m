function [ ] = eps_masz() %wyliczanie epsilonu maszynowego 
%x jest dzielony tak dlugo a� otrzynamy najmniejsz� mo�liw� 
%do wygenerowania liczb�
 x=1;
 y=2;

 while  y > 1.0 
 eps = x;
 x = x/2;
 y =1.0 + x;
 end
 eps
end
