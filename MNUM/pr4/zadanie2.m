function [] = zadanie2(h, x1pocz,x2pocz )
    A=0;
    B=20;
    dlugosc=B-A;
   
    beta=[55/24,-59/24,37/24,-9/24];
    beta1=[251/720, 646/720, -264/720, 106/720, -19/720];
    
    B1 = zeros(ceil(dlugosc/h)+1,1);
    B2 = zeros(ceil(dlugosc/h)+1,1);
    
    x1=zeros(ceil(dlugosc/h)+1,1);
    x1(1)=x1pocz;
    x2=zeros(ceil(dlugosc/h)+1,1);
    x2(1)=x2pocz;
   
    for i=1:4 % pierwsze 4 wartosci
        Z(i)=i*h;
        [x1(i+1), x2(i+1)]=RK(h,x1(i),x2(i));
        [B1(i+1), B2(i+1)]=RK(h/2,x1(i),x2(i));
    end
    for i=5:ceil(dlugosc/h) %od pi¹tej do koñca przedzialu
        suma1=0;
        suma2=0;
        for j=1:4
            suma1=suma1+beta(j)*poch1(x1(i-j),x2(i-j));
            suma2=suma2+beta(j)*poch2(x1(i-j),x2(i-j));
        end    
        p1=x1(i)+h*suma1;
        p2=x2(i)+h*suma2;
        w1=poch1(p1,p2);
        w1=poch2(p1,p2);
        suma1=0;
        suma2=0;
        for j=1:4
            suma1=suma1+beta1(j+1)*poch1(x1(i-j),x2(i-j));
            suma2=suma2+beta1(j+1)*poch2(x1(i-j),x2(i-j));
        end
        suma1=suma1+h*beta1(1)*w1;
        suma2=suma2+h*beta1(1)*w2;
        x1(i)=x1(i-1)+h*suma1;
        x2(i)=x2(i-1)+h*suma2;
        B1(i)=abs((p1-x1(i))*19/270); % b³¹d 1
        B2(i)=abs((p2-x2(i))*19/270); % b³¹d 2

        
    end
    
    plot(abs(E2));
    
end

