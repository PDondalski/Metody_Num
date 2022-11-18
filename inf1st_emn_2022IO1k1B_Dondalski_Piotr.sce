//Piotr Dondalski, Informatyka, IO, gr1, kolokwium nr 1 wersja B
clear; //Zad 1
clc; //Zad 2
clf; // Zad 3

disp("Piotr Dondalski, Informatyka, 1, IO") //Zad 4

A = [1 1/2 1/3
     1/2 1/3 1/4];
//Zad 5
disp(A); 
//Zad 6
for i=1:2
    for j=1:3
        B(i,j)=A(i,j)^2
end
//Zad 7
function xf=z(a)
    xf=2*z(a-1)+1;
endfunction

//Zad 8
function C=f(x);
    C=log(sin^2(x)+0.1);
endfunction

//Zad 9
disp(f(0)); 

//Zad 10
//Zad 11
function X=det2(M);
    X=M(1,1)*M(2,2)-M(2,1)*M(1,2);
endfunction
//Zad 12
disp(A(:,1));
disp(A(:,2));

//Zad 13
function y=g(x);
    if x<=0 then
        exp(x);
    end
    if x>0 then
        log(x);
    end;
endfunction

//Zad 14
l=-5;
p=15;
lp=200;

tw=linspace(l,p,lp)';

for i=1:lp
    fw(i)=g(i);
end;

plot(tw,fw,"k");












