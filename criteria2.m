function [result] = criteria2(x0,h,y,alpha,T)
%CRITERIA2 calcule le critère à optimiser en 2D
    x=reshape(x0,size(y,1),size(y,2));
    result = norm(y-conv2(x,h,'same'),'fro');
    for i=1:size(x,1)
        for j=1:size(x,2)
            result = result + alpha * phi2(x,i,j,T);
        end
    end
end

