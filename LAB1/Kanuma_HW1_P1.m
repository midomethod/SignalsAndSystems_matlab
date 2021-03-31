%   Clearing the workspace
close all 
clear all 
clc

x = 1:1:100;            %   Initialize x as specified

i = 1;                  %   Initialize counter i at 1
y = [];                 %   Initialize an empty array y

while   i<=100          %   While index of x is less than 101
    if  mod(x(i),2)==0  %   If element of x is even...
        y = [y,x(i)];   %       ...concatenate y with that value.
    end
    i = i+1;            %   Increment index
end

disp("y:");
disp(y);

