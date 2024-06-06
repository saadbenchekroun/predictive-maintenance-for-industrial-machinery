clc
format long
x=0:0.1:1;
f=@(x) (x+1).*(x-3./4);
p1=plot(x,f(x));
set(p1,'Color','blue','LineWidth',2);
hold on;

g=x-x;
p2=plot(x,g);
set(p2,'Color','red','LineWidth',2);

grid;
xlabel ('x');
ylabel ('f(x)');
title('Graphe de f(x)=(x+1)(x-3/4) sur l''intervalle [0,1]')