function [] = GenerateBigMat()
%GENERATEBIGMAT Generates big matrices
    % total number of tests
    num_tests = 10;
    % coeficient to scale random number generated
    coef = 10;
    % initial dimensions of matrix
    min_dim = 200;
    max_dim = 300;

    % generate first 20 tests normally
    for i = 1 : num_tests
        n = uint32(rand() * (max_dim - min_dim) + min_dim);
        
        % generate matrix A and vector b
        A = coef * rand(n, n);
        b = coef * rand(n, 1);

        % make A diagonally dominant
        for j = 1 : n
            elem_sum = sum(A(j, :)) - A(j, j);
            A(j, j) = elem_sum + coef*rand();
        end

        % write in file
        path = strcat("in/", "test", num2str(i), ".in");
        Write(A, b, path);
        
        % increase size of matrix
        min_dim = min_dim + 50;
        max_dim = max_dim + 50;
 
    end
end

