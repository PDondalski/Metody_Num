clear; // czyszczenie zmiennych
clc; // czyszczenie konsoli
M = [2.541,2.112
     1.872,1.556];
E = [0.0,0.0
     0.0,0.0];
b = [4.653
     3.428];
disp(M);
disp(E);
disp(b);
// tablica jest wektorem jak ma tylko jeden wiersz, 
//albo tylko jedną kolumnę. Scilab rozpoznaje to
//automatycznie

function y=wz2(C); // po znaku = jest nazwa funkcji
    y=C(1,1)*C(2,2)-C(1,2)*C(2,1);
endfunction

wz2(M); // pracujemy na kopii zmiennej M
