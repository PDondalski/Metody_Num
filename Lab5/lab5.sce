clear;
clc;
clf; // otwiera okno graficzne po wykonaniu programu (czyści zawartość okna graficznego)
// opcja scf - set current figure - wybór okna graficznego do wyczyszczenia
n = 8;
//l=         //lewa krawędź przedziału
//p=         //prawa krawędź przedziału
//lp=        //liczba punktów

for i=0:n
    xw(i+1)=-6+2*i;
end;

function y=f(x);
    y=x*sin(x);
endfunction;

for i=0:n
    yw(i+1)=f(xw(i+1));
end;

X=ones(n+1,1);
//X=(:,2)=xw; // wybór drugiej kolumny

for j=2:(n+1)
    X(:,j)=X(:,j-1).*xw;
end;

aw = X\yw; // to mowi: uruchom metodę eliminacji gausa na układzie równań gdzie (...) to X a nr wiersza to y (?)

function y=Wn(x,a,n);
    y=a(1);
    for i=1:n
        y=y+a(i+1)*x^i;
    end;
endfunction;

//l=xw(1)-0.5;
//p=xw(n+1)+0.5;
//lp=300;
l=xw(1)-10;
p=xw(n+1)+10;
lp=300;
//przygotowujemy siatkę punktów - funkcja "linspace" - sama wyliczy punkty
tw=linspace(l,p,lp)';//lewa krawędź, prawa krawędź, liczba punktów - argumenty
//znak ' zamienia wiersze z kolumnami (transponuje) można sotosować do tablic wpisanych ręcznie, do zmiennych wpisanych, do wyniku który zwraca tablicę.
//wektor współrzędnych x i y utworzy z tego wykres

//wektor wartości funkcji f w punktach odpowiadających siatce wykresu
//SPOSÓB 1 - Działa ZAWSZE
//fw - wektor wartości funkcji
for i=1:lp
    fw(i)=f(tw(i));
    Wnw(i)=Wn(tw(i),aw,n);
end;
//tworzy drugi wektor fw i elementy bierze z jednego wektora i przykłada do nich funkcję f i wartość która wychodzi wpisuje w drugi wektor
//współrzędna x - tw(i), współrzędna y - f(tw(i))
//Używamy 1 indeksu dlatego domyślnie tworzy w postaci pionowej (rozpoznaje wektor)
//Wn(x,a,n) x - tw(i); a - aw

//funkcja plot tworzy wykresy dwuwymiarowe w scilabie. Zmiana koloru wykresu i wyglądu. W dokumentacji Scilaba mozna znaleźć jak zmienić opis wykresu, okna wykresu, wygląd elementów itp.
plot(tw,fw);
plot(tw,Wnw,"r");//wielomian interpolacyjny
//plot może zawierać łańcuch tekstowy - piszemy pewną specyfikację według której scilab zmieni, zmodyfikuje wykres
plot(xw,yw,"k.")//wektor wartości węzła i specyfikator. k - czarny kolor. "." - specyfikator koloru wtykresu, dane które podałem w funkcji plot mają zostać zapisane w postaci czarnych kropek

//Na kolokwium
//Wysłać plik scilaba na maila (plik określona nazwa, mail określony temat itp.)
//Zapisywać plik co chwila w trakcie pisania kolokwium
//Jak napiszemy kolokwium to zapisac jedną niemodyfikowaną kopię kolokwium. NIE MODYFIKOWAĆ JEJ!!
//Sprawdzanie kolosa:
//Pan wrzuca plik i sprawdza czy się kompiluje, ale mogą być drobne błędy które wcześnie wysupią program.
//Więc dukuje pliki i czyta kod. Mozna dostać punkty cześciowe tak czy inaczej po sprawdzeniu pisemnym

//WZÓR INTERPOLACYJNY LAGRANGE'A i oszacowanie błędu interpolacji

//skrypt przybliży nam wartość funkcji f (małe) w jakimś punkcie x z kreską poziomą nad x (jak negacja)
//rozwiązanie za pomocą wzoru interpolacyjnego lagrange'a.
//Zakładamy, że chcemy żeby wartość wielomianu interpolacyjnego przybliżała tą wartość f(x z kreską) z dokładnością 10^-r (przybliżenie z dokładnością r miejsc po przecinku)
//Po obliczeniu może wyjść nam różna dokładność, ale jest wzór który mówi jak można oszacować dokładność wzoru interpolacyjnego. Najpierw liczymy oszacowanie błędu, jak wyjdzie mniejsze od 10^-r to realizujemy wzór lagrange'a, a jak nie to nie, bo i tak nie da nam żądanej dokładności.
//Parametr N - numer ostatniego węzła, punkty a,b; punkty węzłowe; punkt w którym chcemy badać dokładność, funkcja którą będziemy przybliżać i parametr N - dokładność. 
//Szukamy oszacowania błędu, tą która znajduje się z prawej strony błędu interpolacji i chcemy ją zbadać. Jak jest < to liczymy wartośc interpolacji w punkie x z kreską, a jak nie to nie.
//Stała pi - odwołujemy  się jako %pi

//wprowadzamy dane, deklarujemy f małe i nie wiem co dalej bo za szybko mówił xd
//Pochodne trzeba liczyć samemu na kartce!!!
//5 pochodna funkcji f i dopiero zadeklarować w scilabie jako funkcję.





















