function p = predictive_model(x, y, c)
    % predictive_model: Builds a predictive model using Newton's Divided Difference interpolation
    % Input: 
    %   x - The vector of historical data points (e.g., time)
    %   y - The vector of sensor data (e.g., temperature, pressure)
    %   c - The current time or future time to predict the value at
    % Output:
    %   p - Predicted sensor value at the given time 'c'
    
    n = min(length(x), length(y));
    p = zeros;              % Initialize the polynomial output
    a = y;                  % Divided difference table starts with y values
    w = y;                  % Auxiliary variable for divided differences
    N = zeros;              % Multiplicative terms in Newton's formula

    % Calculate divided differences
    for i = 2:n
        for j = i:n
            w(j) = (a(j) - a(j-1)) / (x(j) - x(j-(i-1)));
        end
        for j = i:n
            a(j) = w(j);
        end
    end

    % Evaluate Newton's polynomial at 'c'
    for i = 2:n
        for j = 1:i-1
            N(j) = c - x(j);
        end
        p(i) = a(i) * prod(N);
    end
    p = a(1) + sum(p);
end
