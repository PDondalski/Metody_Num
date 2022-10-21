clear; // czyszczenie zmiennych
clc; // czyszczenie konsoli
//M = [2.541,2.112
//     1.872,1.556];
//E = [0.0,0.0
//     0.0,0.0];
//b = [4.653
//     3.428];

//M = [2.541,2.112
//     1.872,1.556];
//E = [0.001,0.001
//     -0.001,-0.002];
//b = [4.653
//     3.428];
     
//M = [1,2
//     1,1];
//E = [0.001,0.001
//     -0.001,-0.002];
//b = [4.653
//     3.428];

M = [1,2
     1,1];
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

//function C=msum(A,B);
//        C(1,1)=A(1,1)+B(1,1);
//        C(1,2)=A(1,2)+B(1,2);
//        C(2,1)=A(2,1)+B(2,1);
//        C(2,2)=A(2,2)+B(2,2);
//endfunction

function C=msum(A,B);
    C=A+B;
endfunction

wz2(M); // pracujemy na kopii zmiennej M

// Każdy operator scilaba występuje w dwóch wersjach: Wersja z kropką (skalarna, która działa na składowych, czyli jesli napiszę jedna macież razy * druga macież to nie wykona się mnożenie macieży tylko mnożenie tych które leżą na tych samych pozycjach (po współrzędnych)
//Wersja bez kropki, pracujemy na całej macieży a nie na współrzędnych.

//METODA CRAMERA
function Wk=Cmk(A,w,k);
    Wk=A;
    Wk(:,k)=w; // użycie dwukropka powoduje, że scilab bierze wszystkie wartości, wszystkie numery wierszy (w tym przypadku wiersza macierzy)
endfunction

ME = msum(M,E);
dME = wz2(ME);
if  dME<>0 then
    //metoda Cramera
    x(1,1)=wz2(Cmk(ME,b,1))/dME;
    x(2,1)=wz2(Cmk(ME,b,2))/dME;
    disp("x=",x);
else
    //brak rozwiązań
    disp("Wyznacznik główny zerowy - brak rozwiązań układu");
end;



















