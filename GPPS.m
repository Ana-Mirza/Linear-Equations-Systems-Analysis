function [x] = GPPS(A,b)
    % Gaussian elimination with partial pivoting and scalation
    n_temp = size(A);
    n = n_temp(1);
    % augmented matrix
    Ae = [A, b];
    
    for p = 1 : n - 1
        % get the absolute maximum for each line in the s_factors column vector
        s_factors = max(abs(Ae(p : n,  p : n)'))';
        % find the absolute maximum scaled to its factor from A(p:n, p) to
        % use it as a pivot
        [pivot, pivot_line] = max(abs(Ae(p : n, p)) ./ s_factors);
        pivot_line = pivot_line + p - 1;
    
        % get the new pivot on diagonal position
        temp = Ae(p, :);
        Ae(p, :) = Ae(pivot_line, :);
        Ae(pivot_line, :) = temp;
    
        % gaussian elimination
        for i = p + 1 : n
            arg = Ae(i, p) / Ae(p, p);
            Ae(i, :) = Ae(i, :) - arg * Ae(p, :);
        end
    end
    
    % solve the upper triangular system after separating A and b from Ae
    A = Ae(:, 1 : n);
    b = Ae(:, n + 1);
    x = SST(A, b);
end
