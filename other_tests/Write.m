function [] = Write(A, b, path)
%WRITE Summary of this function goes here
%   Detailed explanation goes here
    file = fopen(path, "w");

    [n, m] = size(A);
    % write dimentions of matrix in file
    fprintf(file, "%d %d\n", int32(n), int32(m));

    % write matrix in file
    for i = 1 : n
        for j = 1 : m
            fprintf(file, "%f ", A(i, j));
            if j >= n
                fprintf(file, "\n");
            end
        end
    end

    fprintf(file, "\n");
    % write b in file
    for i = 1 : m
        fprintf(file, "%f ", b(i));
    end

    fclose(file);
end

