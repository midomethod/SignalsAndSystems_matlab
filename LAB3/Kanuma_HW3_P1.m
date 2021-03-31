close all
clear all
clc

% Constants taken from equation 1
R = 2;
C = 1;
L = 0.5;

% New constants for use in the dsolve() function
a = R*C;
b = 1;   
c = R/L;      

% Solving for the homogeneous solution y(t) with initial conditions y(0)
% and Dy(0) =1
y = dsolve('a*D2y+b*Dy+c*y=0','y(0)=0','Dy(0)=1');
h = diff(y);        % h(t) = Dy(t)

% Making the time tange from -10 to 30
t = -10:0.1:30;

% Evaluating h(t) on t
h_t = ((exp(-(t*(b + (b^2 - 4*a*c)^(1/2)))/(2*a))*(b + (b^2 - 4*a*c)^(1/2)))/(2*(b^2 - 4*a*c)^(1/2)) - (exp(-(t*(b - (b^2 - 4*a*c)^(1/2)))/(2*a))*(b - (b^2 - 4*a*c)^(1/2)))/(2*(b^2 - 4*a*c)^(1/2))).*heaviside(t);
 
% Plotting t against h(t) on -10 to 30
figure(1);
plot(t,h_t);
xlabel('t');
ylabel('h(t)');


