function [] = GenerateOutput()
%GENERATEOUTPUT Generate output for input tests
    num_tests = 40;

    for i = 1 : num_tests
        in_path = strcat("in/", "test", num2str(i), ".in");
        [A, b] = ReadInput(in_path);
        x = A \ b;

        % write in output file
        out_path = strcat("out/test", num2str(i), ".out");
        WriteOutput(x, out_path);
        
    end
end

