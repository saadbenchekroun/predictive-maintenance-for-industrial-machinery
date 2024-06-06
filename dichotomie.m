function [c, n]=dichotomie(x0,x1,eps)
n=1;
a=x0;
b=x1;
n0=fix((log((b-a)./eps)./log(2))-1)+1;
f=@(x) (x+1).*(x-3./4);
if f(a)*f(b)>0
    fprintf('f(a) et f(b) ont le meme signe!!!');
end
while n<=n0
    if f(a)==0
        c=a;
        break
    elseif f(b)==0
        c=b;
        break
    end
    c=(a+b)/2;
    if f(c)==0
        break
    end
    if f(a)*f(c)<0
        b=c;
    elseif f(b)*f(c)<0
        a=c;
    end
    n=n+1;
end
fprintf('La solution dans l''intervalle [%x,%x] est %f \n', x0, x1,c)
fprintf('Le nombre d''iterations est %d \n', n)
end