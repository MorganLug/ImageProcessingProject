clear all; % clear memory
close all; % close figures

options = optimoptions("fminunc");
options = optimoptions(options,'Display','iter','MaxFunctionEvaluations',1000,'StepTolerance',1e-10,'SpecifyObjectiveGradient',true,'CheckGradients',true);
% Initial solution
x0=10;


% Compute initial objective value
fprintf('x0=%.2f, f=%fnn',x0,test(x0));

% Run optimization solver
xsol = fminunc(@(x)test(x),x0,options);
fprintf("Final solution=%.2f, f=%fnn",xsol, test(xsol));