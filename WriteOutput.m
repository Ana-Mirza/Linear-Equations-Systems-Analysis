function [] = WriteOutput(x, path)
%WRITEOUTPUT Summary of this function goes here
%   Detailed explanation goes here
    n = size(x, 1);

    % open file to write in
    file = fopen(path, "w");
    
    % check if solution exists
    if isnan(x(1 : n))
       fprintf(file, "Sistem incompatibil/Sistem compatibil nedeterminat");
    else
        % write solution x in file
        for i = 1 : n
            fprintf(file, "%f ", x(i));
        end
    end

    % close file
    fclose(file);
end

