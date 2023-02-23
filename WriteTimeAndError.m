function [] = WriteTimeAndError(time, error, alg, num)
%WRITETIMEANDERROR Writes time and error of chosem method in results file
    %open file to write in
    out_path = strcat("other_tests\results\", alg, "\test", num2str(num), ".out")
    file = fopen(out_path,"w");

    % write results
    fprintf(file, "time: %f\n", time);
    if isnan(error)
        fprintf(file, "matrix does not converge\n");
    else
        fprintf(file, "error: %f\n", error);
    end
    % close file
    fclose(file);
end

