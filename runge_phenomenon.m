% Phenomene de Runge
f = @(x) 1./(1 + x.^2);
x0 = -1:0.5:1;
x1 = f(x0); % Les points d’interpolation

P = @(x) 0.4 .* x.^4 - 0.9 .* x.^2 + 1; % Le polynome d’interpolation
xx = -1:0.1:1;
yy = interpolLvec(x0, x1, xx);

zz = f(xx);
x2 = P(xx);
hold on
plot(xx, x2, '-k', 'LineWidth', 1) % Graphe du polynome d’interpolation
hold on
plot(x0, x1, 'or', 'MarkerSize', 16) % Graphe des noeuds d’interpolation
hold on
plot(xx, yy, 'ob', 'LineWidth', 3) % Graphe de l’algorithme d’interpolation
hold on
plot(xx, zz, '-g', 'LineWidth', 1) % Graphe de la fonction
grid;
legend('poly', 'noeud', 'interpol', 'exact');
title('Phenomene de Runge');
fprintf('L’erreur maximale est: \n')
fprintf('%d\n', max(abs(yy - zz))) % <10^(-5)
