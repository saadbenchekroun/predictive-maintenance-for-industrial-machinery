function p = newton(x, y, c)
n = min(length(x), length(y));
p = zeros;
a = y; 
N = zeros;
w = y;
for i = 2:n
    for j = i:n
        w(j) = (a(j) - a(j - 1)) / (x(j) - x(j - (i - 1)));
    end
    for j = i:n
        a(j) = w(j);
    end
end
for i = 2:n
    for j = 1:i - 1
        N(j) = c - x(j);
    end
    p(i) = a(i) * prod(N);
end
p = a(1) + sum(p);
end