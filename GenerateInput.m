function [] = GenerateInput()
%GENERATEINPUT Generates input tests
    % total number of tests
    num_tests = 40;
    % coeficient to scale random number generated
    coef = 10;
    % initial dimensions of matrix
    min_dim = 10;
    max_dim = 20;

    % generate first 20 tests normally
    for i = 1 : num_tests / 2
        n = uint32(rand() * (max_dim - min_dim) + min_dim);
        
        % generate matrix A and vector b
        A = coef * rand(n, n);
        b = coef * rand(n, 1);

        % write in file
        path = strcat("in/", "test", num2str(i), ".in");
        WriteInput(A, b, path);
        
        % increase size of matrix
        min_dim = min_dim + 2;
        max_dim = max_dim + 2;
    end

    % generate next 20 tests with convergent matrices
    for i = num_tests/2 + 1: num_tests
        n = uint32(rand() * (max_dim - min_dim) + min_dim);
        
        % check to not go over 100 
        if n > 100
            n = 100;
        end

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
        WriteInput(A, b, path);
        
        % increase size of matrix
        min_dim = min_dim + 2;
        max_dim = max_dim + 2;
    end
end
