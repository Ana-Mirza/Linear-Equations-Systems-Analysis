function [] = TestGPPS()
%TESTGPPS Test GPPS method's accuracy and time performance

    % read input A and b
    [A, b] = ReadInput("test.in");
    % calculate solution using GPPS method
    tic
    x = GPPS(A, b);
    time = toc;
    time
    % write output
    WriteOutput(x, "test.out");
    precision = norm(b - A * x);
    precision
    
    % write time and precision in special file
    WriteTimeAndError(time, precision, "GPPS", 1);
end

