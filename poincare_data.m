%This code is second part of numerical bifurcation code. In this code, 
%.mat file, which got generted bu numerical_bifurcation.m is called and
%points of interest is being collected. For an example, in this code, the
%variable of interest is x1, i.e., the amplitude, so we collect the maximum
%of x1 by finding out the points where x2 (velocity) is zero.
clear all
close all
clc
format long
for k=1:2000
    filename=sprintf('x_sol%d',k);
    load(filename)
    m=find(x(1:end-1,2).*x(2:end,2)<0);
    n=size(m);
   temp=k_i;
    temp2=x(m(:,1),1);
    x1=ones(n(1),2);
    x1(:,2)=temp2;
    x1(:,1)=temp;
   dlmwrite('data_forward_test.txt',x1,'-append')
    k 
end