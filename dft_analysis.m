function X = dft_analysis(x)
    % dft_analysis: Applies the Discrete Fourier Transform (DFT) to sensor data
    % Input: 
    %   x - A vector containing time-domain sensor data (e.g., vibration)
    % Output:
    %   X - The frequency-domain representation of the input signal
    
    N = length(x);           % Length of the input signal
    X = zeros(1, N);         % Initialize the output (frequency domain data)
    
    % Perform DFT to transform the signal to the frequency domain
    for k = 0:N-1
        for n = 0:N-1
            X(k+1) = X(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
        end
    end
end
