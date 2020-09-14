function [result] = phi2(matrix,line,column,T)
%PHI2 calcule phi en 2D
    result=0;
    if line~=1
        result = result + sqrt((matrix(line,column)- matrix(line-1,column))^2 + T^2) - T^2;
    end
    if line ~= size(matrix,1)
        result = result + sqrt((matrix(line,column)- matrix(line+1,column))^2 + T^2) - T^2;
    end
    if column ~= 1
        result = result + sqrt((matrix(line,column)- matrix(line,column-1))^2 + T^2) - T^2;
    end
    if column ~= size(matrix,2)
        result = result + sqrt((matrix(line,column)- matrix(line,column+1))^2 + T^2) - T^2;
    end
end

