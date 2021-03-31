%   Clearing the workspace
close all 
clear all 
clc

t = -2*pi:pi/30:2*pi;           % Defining the t-domain [-2pi,2pi]

y1 = [];                        % Initializing empty array to store MySinc
for i = 1:1:length(t)           % For every element of t
    y = MySinc(t(i));           % Compute MySinc and concatenate the vector
    y1 = [y1,y];
end

y2 = sinc(t);                   % Using the built in sinc function

% Plot them on the same graph
plot(t,y1);
hold on
plot(t,y2);
xlabel('x');
legend('MySinc(x)','sinc(x)');


