%% Preliminaries
% yalmip is required
clc
clearvars
close all
load('auv.mat')

%% plotting
% plot 2D
figure
hold on
for i=1:NAg
    [F,p] = compileCCG(Observers{i+NAg}.X_hat);
    plot(F,p((i-1)*dim_a+dim_plot_2D),'b')
end
for i=1:NAg
    [F,p] = compileCCG(Observers{i}.X_hat);
    plot(F,p((i-1)*dim_a+dim_plot_2D),'r')
end
for j=1:NAg
    plot(Traj_x((j-1)*dim_a+dim_plot_2D(1),:),Traj_x((j-1)*dim_a+dim_plot_2D(2),:),'k-')
end
grid on
xlabel(sprintf('x(%i)',dim_plot_2D(1)),'interpreter','latex')
ylabel(sprintf('x(%i)',dim_plot_2D(2)),'interpreter','latex')
setniceplot
box on
print -dpdf Plot_2d
