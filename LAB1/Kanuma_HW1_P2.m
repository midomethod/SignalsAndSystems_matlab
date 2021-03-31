%   Clearing the workspace
close all 
clear all 
clc

x = [];                 % This will be the 2D array to store answer

for f = 10:5:20                     % For f = 10,15,20...
    r = [];                         % Initialize empty array to construct the row 
    for t = 0:0.1:0.4                   % and for t = 0,0.1,0.2,0.3,0.4...
        v = 3*cos(2*pi*f*t+0.1);        % compute the value of x(t)
        %disp("t = "+t+",f = "+f);
        r = [r,v];                      % add x(t) to the end of the row
    end
    x = [x;r];                      % Concatenate the row generated to the bottom of the 2D array
end

disp("Resulting 2D array:");
disp("   f\t        0.0       0.1       0.2       0.3       0.4");
fv = [10;15;20];
x=[fv,x];
disp(x);
