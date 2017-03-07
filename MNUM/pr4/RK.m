function [ y1,y2 ] = RK( h,x1,x2 )
%fuknkcja liczy pierwsze 4 kroki dla metody predyktor-korektor 
 K=zeros(2,4);

 K(1,1)=poch1(x1,x2);
 K(2,1)=poch2(x1,x2);
        
 K(1,2)=poch1(x1+1/2*h,x2+1/2*h*K(2,1));
 K(2,2)=poch2(x1+1/2*h,x2+1/2*h*K(2,1));
        
 K(1,3)=poch1(x1+1/2*h,x2+1/2*h*K(2,2));
 K(2,3)=poch2(x1+1/2*h,x2+1/2*h*K(2,2));
        
 K(1,4)=poch1(x1+h,x2+h*K(2,3));
 K(2,4)=poch2(x1+h,x2+h*K(2,3));
       
 y1=x1 +1/6*h*(K(1,1)+2*K(1,2)+2*K(1,3)+K(1,4));
 y2=x2 +1/6*h*(K(2,1)+2*K(2,2)+2*K(2,3)+K(2,4));
end

