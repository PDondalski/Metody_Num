clear;
clc;
clf;

//obliczyć parametry od a0 do as i od b0 do bs
//Zagadnienie aproksymacji średniokwadratowej trygonometrycznej
//Liczba warunków której żądamy od warunku trygonometrycznego nie może przekraczać liczb które mamy, bo spadnie dokładność, stąd postać Smax
// N - liczba wartości, zabieram jedną informację do wyliczenia współczynnika a0, potem dzielę na dwa. N-1 nie musi być parzyste dlatego biorę część całkowitą. Jeśli parametr będzie większy to nie liczymy nic, jak mniejszy to bez lipy
//%pi z dokładnością do 16 miejsc po przecinku (masksymalnie dokładne przy podwójnej precyzji)
//a jest przeindeksowane (a0-as) a b nie jest przeindeksowane (b1-bs)


N=9;
s=4;
fw=[-1.12;-1.57;-0.73;-0.21;0.11;0.31;0.51;-1.73;-1.24];
l=-20;
p=20;
lp=500; // parametr przechowuje liczbę punktów, 500 żeby wygenerował się jak najdokładniejszy wykres, a przypisanie zmiennej lp w celu łatwiejszej zmiany tego parametru.

s_max=floor((N-1)/2);
if s<=s_max then
    //aproksymacja średniokwadratowa wielomianowa
    for i=0:(N-1)
        xw(i+1)=2*%pi*i/N;
    end;
    for j=0:s // Wektory współczynników
        aw(j+1)=0;
        for i=0:(N-1)
            aw(j+1)=aw(j+1)+fw(i+1)*cos(j*xw(i+1));
        end;
        aw(j+1)=aw(j+1)*2/N;
    end;
    for j=1:s
        bw(j)=0;
        for i=0:(N-1)
            bw(j)=bw(j)+fw(i+1)*sin(j*xw(i+1))
        end;
        bw(j)=bw(j)*2/N;
    end;
    //Funkcja musi mieć x jako argument, wektory współczynników aj(wsp cosinusowe) i bj(współczynniki sinusowe). Przez parametr a przekazujemy elementy od a0 do as. Przz b elementy od b1 do bs.
    function y=Fs(x,s,a,b);
        y=a(1)/2;
        for j=1:s
            y=y+a(j+1)*cos(j*x)+b(j)*sin(j*x);
        end;
    endfunction;
    xt = linspace(l,p,lp)';
    for i=1:lp
        Fst(i)=Fs(xt(i),s,aw,bw);
    end;
    plot(xt,Fst);
    plot(xw,fw,".k");
    //wykres od -20 do 20 ale chcemy zachowac możliwość manipulacji, więc nie wprowadzamy na sztywno tylko dajemy zmienne l i p z wymiarami wykresu  żeby łatwo można było nimi manipulować i te zmienne zapisujemy gdzieś na początku kodu z innymi zmiennymi. Dokładamy jeszcze do wykresu pary trygonometryczne. Będą zaznaczone jako punkty w innym kolorze, dlatego przy wywoływaniu plota trzeba użyć łańcucha tekstowego do sformatowania wykresu, chcemy żeby to były kropki czarne.
// Interpolacja szczególny przypadek aproksymacji  (jak damy 4 w s)
//Transformacja Fouriera
else
    //komunikat
    disp("Parametr s="+string(s)+" jest zbyt duży.");
end
























