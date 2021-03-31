close all
clear all
clc

M = 100;
b1 = 20+1e-12;  % Using 20 + very small number since at exactly 20, it returns NaN
b2 = 0.2;
k = 1;

% Using dsolve to find the expression for h(t)
y1 = dsolve('M*D2y+b1*Dy+k*y = 0','y(0)=0','Dy(0)=1');
h1 = diff(y1);

y2 = dsolve('M*D2y+b2*Dy+k*y = 0','y(0)=0','Dy(0)=1');
h2 = diff(y2);

% Evaluating h1 and h2 on -10 to 300
t = -10:0.1:300;
h1 = ((exp(-(t.*(b1 + (b1^2 - 4*M*k)^(1/2)))/(2*M))*(b1 + (b1^2 - 4*M*k)^(1/2)))/(2*(b1^2 - 4*M*k)^(1/2)) - (exp(-(t.*(b1 - (b1^2 - 4*M*k)^(1/2)))/(2*M))*(b1 - (b1^2 - 4*M*k)^(1/2)))/(2*(b1^2 - 4*M*k)^(1/2))).*(t>=0);
h2 = ((exp(-(t.*(b2 + (b2^2 - 4*M*k)^(1/2)))/(2*M))*(b2 + (b2^2 - 4*M*k)^(1/2)))/(2*(b2^2 - 4*M*k)^(1/2)) - (exp(-(t.*(b2 - (b2^2 - 4*M*k)^(1/2)))/(2*M))*(b2 - (b2^2 - 4*M*k)^(1/2)))/(2*(b2^2 - 4*M*k)^(1/2))).*(t>=0);

% Plotting them on the same figure
figure(1);
subplot(2,1,1);
    plot(t,h1);
    ylabel('b = 20 kg^-1');
subplot(2,1,2);
    plot(t,h2);
    ylabel('b = 0.2 kg^-1');

