function u=newtonappro(x0,nmax)

f=@(x) (x+1).*(x-3./4);
fprime=@(x) 2.*x+1./4;

y=zeros(nmax);
y(1)=x0;
for i=1:nmax-1
    y(i+1)=y(i)-(f(y(i))/fprime(y(i)));
end
u=y(nmax);
fprintf('La valeur approchee de la racine est :\n')
end
