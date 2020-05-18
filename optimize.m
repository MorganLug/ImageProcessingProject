function [xsol] = optimize(x0,h,y,alpha)
%OPTIMIZE Summary of this function goes here
%   Detailed explanation goes here

    options = optimoptions("fminunc");
    options = optimoptions(options,'Display','iter','MaxIterations',10,'StepTolerance',1e-10,'SpecifyObjectiveGradient',false,'CheckGradients',true);

    % Run optimization solver
    xsol = fminunc(@(x)criteria(x,h,y,alpha),x0,options);
end

