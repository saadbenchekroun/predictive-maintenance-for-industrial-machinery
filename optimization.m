function u = optimization(x0, nmax)
    % optimization: Uses Newton's method to optimize machine operational parameters
    % Input: 
    %   x0 - Initial guess for the optimal value (e.g., pressure or temperature)
    %   nmax - Maximum number of iterations for convergence
    % Output:
    %   u - Optimized value for the machine parameter

    % Example machine performance function and its derivative
    f = @(x) (x + 1) .* (x - 3 / 4);  % Function representing machine performance
    fprime = @(x) 2 .* x + 1 / 4;     % Derivative of the performance function

    y = zeros(1, nmax);  % Initialize an array to store iterates
    y(1) = x0;           % Start with the initial guess

    % Newton's method iterations
    for i = 1:nmax-1
        y(i+1) = y(i) - (f(y(i)) / fprime(y(i)));  % Update the guess using Newton's method
    end

    u = y(nmax);  % The final optimized value after nmax iterations
    fprintf('The optimized parameter value is: %f\n', u);
end
