%   Clearing the workspace
close all 
clear all 
clc

%   15 elements between 0 and 1 inclusive means
%   that the distance between elements is 1/14.

t = 0:1/14:1;                           % Defines the 15-element t vector
x = 4*cos(2*pi.*t+0.2)+3*sin(pi^2.*t);  % Compute x based on t

average = 0;                            % The average values of 0 elements is 0
min = x(1);                             % We will pretend that x(1) is min and max
max = x(1);
indeces = [];                           % Initialize vector to store indeces

for i = 1:1:15                          % For every element of x
    average = (average*(i-1)+x(i))/i;   % Update running average
    if x(i)>4           
        indeces = [indeces,i];          % Store the index if x>4
    end
    
    if x(i)>max
        max = x(i);                     % Update max if greater than current max
    end
    
    if x(i)<min
        min = x(i);                     % Update min if less than current min
    end
    
end

disp("Maximum element value = "+max);
disp("Minimum element value = "+min);
disp("Average of the element values = "+average);
disp("Indeces for which x(t)>4:");
disp(indeces);