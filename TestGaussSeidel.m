function [] = TestGaussSeidel()
%TESTGAUSSSEIDEL Test Gauss Seidel time and accuracy
    [A, b] = ReadInput("test.in");
    x0 = zeros(length(b), 1);
    % calculate solution using GPPS method
    tic
    x = GaussSeidel(A, b, x0);
    time = toc;
    time
    % write output
    WriteOutput(x, "test.out");
    precision = norm(b - A * x);
    precision
    
    % write time and precision in special file
    WriteTimeAndError(time, precision, "GaussSeidel", 1);
end

