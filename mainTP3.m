clear all; % clear memory
close all; % close figures


x1=x_triang_signal();
h=h_gauss_function(15,15,[0:1:30]);
y_nb=conv(x1,h,'same');
y=adgnoise(y_nb,30);
x0=zeros(length(x1),1);
fxo=criteria(x0,h,y,0.01);
xsol=optimize(x0,h,y,0.01);

figure(1);plot([0:1:(length(xsol)-1)],x1);
figure(2);plot([0:1:(length(xsol)-1)],xsol);

% options = optimoptions("fminunc");
% options = optimoptions(options,'Display','iter','MaxFunctionEvaluations',1000,'StepTolerance',1e-10,'SpecifyObjectiveGradient',true,'CheckGradients',true);
% % Initial solution
% x0=10;
% 
% 
% % Compute initial objective value
% fprintf('x0=%.2f, f=%fnn',x0,test(x0));
% 
% % Run optimization solver
% xsol = fminunc(@(x)test(x),x0,options);
% fprintf("Final solution=%.2f, f=%fnn",xsol, test(xsol));