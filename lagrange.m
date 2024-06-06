function p=lagrange(x,y,c)
s=y;
n=length(x);
for i=1:n
    L=c-x;
    for j=1:n
        if (j==i)
            L(j)=1;
        else
            L(j)=L(j)/(x(i)-x(j));
        end
    end
    s(i)=s(i)*prod(L);
end
p=sum(s);
end