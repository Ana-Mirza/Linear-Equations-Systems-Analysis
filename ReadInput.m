function [A, b] = ReadInput(path)
%READINPUT Reads input matrix A and vector b from file path

% open file for reading
file = fopen(path, "r");
n = fscanf(file, "%d", 1);
m = fscanf(file, "%d", 1);

A = zeros(n);
b = zeros(m, 1);

% read matrix A
for i = 1 : n
    for j = 1 : m
        A(i, j) = fscanf(file, "%f", 1);
    end
end

% read vector b
for i = 1 : n
    b(i) = fscanf(file, "%f", 1);
end

% close file
fclose(file);
end

