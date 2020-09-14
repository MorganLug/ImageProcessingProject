function [xsol] = optimizeNonConv(x0,h,y,alpha,T)
%OPTIMIZE Summary of this function goes here
%   Detailed explanation goes here

    options = optimoptions("fminunc");
    options = optimoptions(options,'Display','iter','MaxIterations',10,'StepTolerance',1e-10,'SpecifyObjectiveGradient',false,'CheckGradients',true);

    % Run optimization solver
    xsol = fminunc(@(x)criteriaNonConv(x,h,y,alpha,T),x0,options);
end

