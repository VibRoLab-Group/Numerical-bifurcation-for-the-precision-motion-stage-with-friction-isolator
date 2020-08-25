%This code is being used for generating numerical bifurcation diagram
clc
clear all
close all
%These are the parameters for numerical simulation
global zeta sigma_0 sigma_1 sigma_2 mu_s mu_k a k_i v_rv 
sigma_0=110;
sigma_1=1.37;
sigma_2=0.0823;
mu_s=0.44;
mu_k=0.35;
a=2.5;
zeta=0.02;
v_rv=0.001;
%Since this bifurcation is being generated for integral control as
%bifurcation parameter, we divide the range of k_i (integral control) and
%run numerical simulation for each value of k_i and save the results as
%x_sol%d.mat file.
K_i1=(linspace(0.01,0.2,2000));
 options=odeset('RelTol',1e-8,'AbsTol',1e-8);
 p=20;
 ics1=zeros(4,1)
for k=1:2000
      h=waitbar((k)/2000);
    tic
k_i=K_i1(k)
for kk=1:p
[t,x]=ode45(@eqn,[0 400],ics1,options);
ics1=x(end,:)';
kk;
end
[t,x]=ode45(@eqn,linspace(0,400,6000),ics1,options);
filename=sprintf('x_sol%d',k);
save(filename,'t','x','k_i','v_rv','zeta')
ics1=x(end,:)';
toc
k
p=18;
end
 