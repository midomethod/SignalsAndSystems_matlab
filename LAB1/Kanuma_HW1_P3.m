%   Clearing the workspace
close all 
clear all 
clc

t_ub    = 10^(1/3);                 % Define the upper bound of the test
t_vec   = [];                       % Make an empty vector to store answers

for w   = 35:5:45                   % For w = 35,40,45
    t = 0;                          % Set t = 0
    while t < t_ub                  % While t is within the bounds
        if exp(1.2)*cos(w*t) < 10   % Check if the expression is less than 10
            t_max = t;              %   and push the max
        end
        t = t+0.01;                 % Increment t by 0.01
    end
    t_vec = [t_vec,t_max];          % Store t_max
end

disp("The largest t for which both expressions are less than 10 are:");
disp("@w=35: t = "+t_vec(1));
disp("@w=40: t = "+t_vec(2));
disp("@w=45: t = "+t_vec(3));
