function [] = TestHouseholder()
%TESTHOUSEHOLDER Test Householder algorithm time and precision
   % read input A and b
    [A, b] = ReadInput("test.in");
    % calculate solution using GPPS method
    tic
    x = Householder(A, b);
    time = toc;
    time
    % write output
    WriteOutput(x, "test.out");
    precision = norm(b - A * x);
    precision
    
    % write time and precision in special file
    WriteTimeAndError(time, precision, "Householder", 1);
end

