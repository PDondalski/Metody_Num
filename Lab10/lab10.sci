clear;
clc;

a = -2;
b = -0.8;
r = 10;
nmax = 100;
h = 0.001;

function y=f(x);
    y=x*exp(sin(x))+cos(x);
endfunction;

function y=fp(x,h);
    y=(f(x,h)-f(x))/h;
endfunction;

function y=fpp(x,h);
    y=(fp(x+h,h)-fp(x,h))/h;
endfunction;

function y=g(x);
    y=(f(x+f(x))-f(x))/f(x);
endfunction;


//" - fis
//kw = 0 - normalna praca
//kw = 4 
//xr(wi-1)=xn-1 - poprzedni element

//przyjmujemy liczbe iteracji na 0 (w-0) i metoda newtona ->
//-> JEŚLI WARUNKI f(a)*f(b)<0 ; f(a)*f'(b)>0 ; f"(a)*f"(b)>0 NIE SĄ spełnione to KONIEC (kw=1 - niespełnione założenia)
//JEŚLI SĄ SPEŁNIONE to możemy wystartować z tą metodą. Zaznaczamy, że za chwilę policzymy kolejne przybliżenie, czyli zwiększamy numer aktualnego przybliżenia o 1. W 2 omawianych metodach jest jedno przyblizenie początkowe x0 które w scilabie musi zaczynać się od 1. Warunek początkowy: f(a)*f"(a)>0
//JEŚLI TAK: nasze startowe przybliżenie będzie równe a (xr(wi)=a)
//JEŚLI NIE: nasze startowe przynliżenie będzie równe b (xr(wi)=b)
//Zanim policzymy nowe przybliżenie to zbadamy czy możemy zrobić jeszcze przybliżenie.
//wi<nmax
//Jeśli ostatnio policzona iteracja ma mniejszy numer niż nmax to znaczy, że jeszcze jedną iterację można policzyć.
//JEŚLI NIE to KONIEC z odpowiednim kodem wyjścia (kw=2 - osiągnięto maksymalną liczbę iteracji)
//JEŚLI TAK to będziemy musieli realizować metodę Stephensena.
//W tym przypadku trzeba najpierw zaznaczyć, że mieliśmy miejsce na następne przybliżenie, liczymy je.
//xr(wi-1)=f(xr(wi-1))/f(xr(wi-1))
//(wi-1) - wartość na numerze poprzednim
//Badamy warunek na dokładność wzorem
//JEŚLI TAK - osiągnięto żądaną dokładność to KONIEC (kw=3)
//JEŚLI NIE - bezpośrednio wracamy do sprawdzaia warunku


kw = 0;
wi = 0;
if ((f(a)*f(b))<0)&&((fp(a,h)*fp(b,h))>0)&&((fpp(a,h)*fpp(b,h))>0) then
    wi=wi+1;
    if f(a)*fpp(a,h)>0 then
        
    else;
        xr(wi)=b
    end;
    kw=2;
    while wi<nmax then
        wi=wi+1;
        xr(wi)=xr(wi-1)-f(xr(wi-1))/g(xr(wi-1));
end;

select kw
case 1 then 
    disp("Założenia metody nie są spełnione");
case 2 then
    disp("Osiągnięto maksymalną liczbę iteracji nmax="+string(nmax));
    disp("x("+string(wi)+")="+string(xr(wi)));
case 3 then
    disp("Osiągnięto dokładność");
end;


// zadanie nie jest skończone. Skończone zadanie z trochę innym podejściem w pliku lab10v2.sci



















