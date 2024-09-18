% Handling Runge's Phenomenon
function runge_phenomenon()
    % runge_phenomenon: Demonstrates the mitigation of Runge's phenomenon in interpolation
    % Uses a simple polynomial interpolation to show the difference between overfitting
    % and a robust, stable interpolation model

    f = @(x) 1 ./ (1 + x.^2);  % Original function (smooth, well-behaved)
    x0 = -1:0.5:1;             % Points used for interpolation
    x1 = f(x0);                % Corresponding function values

    % Interpolation polynomial
    P = @(x) 0.4 .* x.^4 - 0.9 .* x.^2 + 1;  % A simple polynomial interpolation

    % Evaluate the interpolation and the original function on finer grid
    xx = -1:0.1:1;
    yy = interpolLvec(x0, x1, xx);  % Interpolated values
    zz = f(xx);                     % Exact function values
    x2 = P(xx);                     % Polynomial approximation

    % Plot the results
    figure;
    hold on;
    plot(xx, x2, '-k', 'LineWidth', 1);  % Polynomial interpolation
    plot(x0, x1, 'or', 'MarkerSize', 8); % Interpolation nodes
    plot(xx, yy, 'ob', 'LineWidth', 2);  % Interpolated points
    plot(xx, zz, '-g', 'LineWidth', 1);  % Exact function
    hold off;

    grid on;
    legend('Polynomial', 'Nodes', 'Interpolated', 'Exact');
    title('Mitigating Runge''s Phenomenon in Interpolation');

    % Calculate the maximum error
    error = max(abs(yy - zz));
    fprintf('Maximum interpolation error: %e\n', error);
end
