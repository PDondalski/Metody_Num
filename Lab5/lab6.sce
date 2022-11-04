clear;
clc;
clf;

n=3;
a=-0.5;
b=2*%pi;
xw=[0;%pi/4;%pi/2;3*%pi/2];
xb=9*%pi/10;
r=2;
function y=f(x);
    y=sin(x);
endfunction;
function y=fp(x);//pochodna funkcji f\
    y=sin(x); //wyjdzie po ręcznym policzeniu pochodnej sinusa | 4 pochodna sinusa to sinus.
endfunction;
//Zabieramy się do policzenia wartości jakiejś cudacznej (omega).
//Piszemy funkcję która będzie nam ją obliczała.
function y=omega(x,n,xi); //xi - węzeł, x, n - numeracja x'ów
    //zmienną tymczasową ustawiamy na 1 a potem w każdym obiegu pętli mnożymy ją przez elementy i w ten sposób dostajemy omegę
    for i=0:n// albo i=0:n+1 i wtedy na dole będzie i a nie i+1
        y=y*(x-xi(i+1));
    end;
endfunction;
