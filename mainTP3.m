clear all; % clear memory
close all; % close figures


x1=x_triang_signal();
h=h_gauss_function(15,15,[0:1:30]);
y_nb=conv(x1,h,'same');
y=adgnoise(y_nb,30);
x0=zeros(length(x1),1);
%x0=x1;
xsol=optimize(x0,h,y,1);

figure
hold on
tiledlayout(2,2)
ax11=nexttile;
plot(ax11,[0:1:(length(xsol)-1)],x1);
title(ax11,"x original");
ax12=nexttile;
plot(ax12,[0:1:(length(xsol)-1)],xsol);
title(ax12,"x déconvolué");
ax21=nexttile;
plot(ax21,[0:1:length(y)-1],y);
title(ax21,"y bruité");
ax22=nexttile;
plot(ax22,[0:1:length(y)-1],conv(xsol,h,'same'));
title(ax22,"Convolution de x optimisé et h");
hold off

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