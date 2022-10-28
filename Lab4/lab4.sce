clear;
clc;
clf; // otwiera okno graficzne po wykonaniu programu (czyści zawartość okna graficznego)
// opcja scf - set current figure - wybór okna graficznego do wyczyszczenia
n = 8;

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

