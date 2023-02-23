function [x] = GaussSeidel(A, b, x0)
    %GAUSS-SEIDEL Gauss-Seidel iterative method
    N = tril(A);
    P = N - A;
    % check if matrix is singular
    if (rcond(full(A)) < 1e-12)
        x = NaN;
        return;
    end

    Ggs = inv(N) * P;
    % calculate the spectral radius of Ggs
    sr =  max(abs(eig(Ggs)));
    % check if the algorithm converges
    if (sr - 1) >= eps
        x = NaN;
        return;
    end
    
    n = length(b);
    x = x0;

    while(1)
        % iterate through every x(i)
        for i = 1 : n
            % compute the sum using the updated values from the current step
            new_values_sum = A(i, 1 : i - 1) * x(1 : i - 1);
    
            % compute the sum usign the previous step values
            old_values_sum = A(i, i + 1 : n) * x0(i + 1 : n);
            
            x(i) = b(i) - (old_values_sum +  new_values_sum);
            x(i) = x(i) / A(i, i);
        end
    
        % check accuracy
        if (norm(x - x0) < 1e-16)
            break;
        end
        % update the last computed values with the new values
        x0 = x;
    end
end

