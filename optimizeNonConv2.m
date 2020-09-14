function [xsol] = optimizeNonConv2(x0,h,y,alpha,T)

    options = optimoptions("fminunc");
    options = optimoptions(options,'Display','iter','MaxIterations',10,'StepTolerance',1e-10,'SpecifyObjectiveGradient',false,'CheckGradients',false);
    xinit=x0(:);
    % Run optimization solver
    xsol = fminunc(@(x)criteriaNonConv2(x,h,y,alpha,T),xinit,options);
    xsol=reshape(xsol,size(y,1),size(y,2));
end

