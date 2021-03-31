%   Clearing the workspace
close all 
clear all 
clc

t1 = -1:0.1:1;          % Define the first t vector with big steps
t2 = -1:0.01:1;         % Define the next t vector with medium steps
t3 = -1:0.001:1;        % Define the last t vector with small steps

% Define an anonymous function g(t)
g=@(t) 3.*pi.*sin(8.*pi.*t+1.3).*cos(4.*pi.*t-0.8).*exp(sin(12.*pi.*t));

g1 = g(t1);             % Compute the function values for the specified steps
g2 = g(t2);
g3 = g(t3);

figure(1);              % Plot them all on the same figure
subplot(3,1,1);
plot(t1,g1);
xlabel('step = 0.1');
subplot(3,1,2);
plot(t2,g2);
xlabel('step = 0.01');
subplot(3,1,3);
plot(t3,g3);
xlabel('step = 0.001');






