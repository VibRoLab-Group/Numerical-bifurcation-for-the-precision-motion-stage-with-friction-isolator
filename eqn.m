function dx = eqn(t,x)
%This function file contains the governing equation of motion in state
%space form
global zeta sigma_0 sigma_1 sigma_2 mu_s mu_k a k_i v_rv 
v_r=v_rv+x(2,1);
g=mu_s+(mu_s-mu_k)*exp(-a*v_r);
dx(1,1)=x(2,1);
dx(2,1)=-2 * zeta * x(2,1) - x(1,1) - k_i * x(3,1) - sigma_0 * x(4,1) - sigma_1 * (v_r - abs(v_r) * sigma_0 * x(4,1) / g) - sigma_2 * v_r ;
dx(3,1)=x(1,1);
dx(4,1)= v_r - abs(v_r) * sigma_0 * x(4,1) / g;
end
