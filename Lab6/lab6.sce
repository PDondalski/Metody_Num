clear;
clc;
clf;

n=3;
a=-0.5;
b=2*%pi;
xw=[0;%pi/4;%pi/2;3*%pi/2];
xb=9*%pi/10;
r=2;
lsup=100;
function y=fp(x);
    y=sin(x);
endfunction;
//function y=fp(x);//pochodna funkcji f
//    y=sin(x); //wyjdzie po ręcznym policzeniu pochodnej sinusa | 4 pochodna sinusa to sinus.
//endfunction;
//Zabieramy się do policzenia wartości jakiejś cudacznej (omega).
//Piszemy funkcję która będzie nam ją obliczała.
function y=omega(x,n,xi); //xi - węzeł, x, n - numeracja x'ów
    y=1;
    //zmienną tymczasową ustawiamy na 1 a potem w każdym obiegu pętli mnożymy ją przez elementy i w ten sposób dostajemy omegę
    for i=0:n// albo i=0:n+1 i wtedy na dole będzie i a nie i+1
        y=y*(x-xi(i+1));
    end;
endfunction;

fact=factorial(n+1);
omg=abs(omega(xb,n,xw));

//function y=sup(a,b,lsup);
//xt=linspace(a,b,lsup)'; // nie wrzucamy do plota tylko do max'a, żeby dostać kres górny
//for i=1:lsup
//    fpt(i)=abs(fp(xt(i)));
//end;
//M=max(fpt); //wartośc maksymalna policzona z wszystkich elementów wektora
//// wartość kresu górnego powinna wyjść dokładnie 1, a wychodzi 1 w zaokrągleniu do 3 (albo 4) miejsc po przecinku.
//endfunction;
//Może się pojawić na kolokwium!
//| | | | | |
//v v v v v v
// napisać coś, ale w postaci funkcji (f zostało dodane, żeby nie było możliwości konfliktu ze zmiennymi globalnymi)
function y=sup(af,bf,lsupf);
xt=linspace(af,bf,lsupf)'; // nie wrzucamy do plota tylko do max'a, żeby dostać kres górny
for i=1:lsupf
    fpt(i)=abs(fp(xt(i)));
end;
y=max(fpt); //wartośc maksymalna policzona z wszystkich elementów wektora
// wartość kresu górnego powinna wyjść dokładnie 1, a wychodzi 1 w zaokrągleniu do 3 (albo 4) miejsc po przecinku.
endfunction;

function phi(x,j,n,xi);
    for i=1:(n+1)
        lt(i)=x-xi(i);
    end;
    lt(j+1)=1;
    for i=1:(n+1)
        mt(i)=xi(j+1)-xi(i);
    end;
    mt(j+1)=1;
endfunction;

M=max(fpt);
err=M*omg/fact;
if err<10^(-r) then
    //obliczyć i wypisać do konsoli Wn(xb)
    for i=1:(n+1)
        Wnt(i)=yw(i)*phi(xb,i-1,n,xw);
    end;
    W=sum(Wnt);
    disp("W"+string(n)+"("+string(xb)+")="+string(W));
else
    // wypisać do konsoli komunikat o zbyt dużym błędzie
    disp("Oszacowanie błędu interpolacji jest zbyt duże: err="+string(err));
end;
//prod (product) - funkcja która zwraca iloczyn wszystkich elementów tablicy
// sum - funkcja która zwraca sumę wszystkich elementów tablicy










