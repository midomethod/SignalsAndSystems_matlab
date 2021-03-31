%   Clearing the workspace
close all 
clear all 
clc

t = 0:0.1:10;                   % Initialize t vector

% Define some constants
f1 = 0.2;                      
f2 = 0.425;

% Function Definitions
s1 = sin(2*pi*f1.*t);
s2 = sin(2*pi*f2.*t+0.4);
s3 = s1+s2;

% Plot the functions on the same graph
plot(t,s1);
hold on
plot(t,s2);
plot(t,s3);
xlabel('t');
legend('S1','S2','S3');