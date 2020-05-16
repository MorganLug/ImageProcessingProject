function [xsol] = optimize(criteria,x0,h,y,alpha,phi)
%OPTIMIZE Summary of this function goes here
%   Detailed explanation goes here
    options = optimoptions("fminunc");
    options = optimoptions(options,'Display','iter','MaxFunctionEvaluations',1000,'StepTolerance',1e-10,'SpecifyObjectiveGradient',true,'CheckGradients',true);

    % Compute initial objective value
    fprintf('x0=%.2f, f=%fnn',x0,criteria(x0,h,y,alpha,@(x)phi(x)));

    % Run optimization solver
    xsol = fminunc(@(x)criteria(x,h,y,alpha,@(x)phi(x)),x0,options);
    fprintf("Final solution=%.2f, f=%fnn",xsol, test(xsol));
end

