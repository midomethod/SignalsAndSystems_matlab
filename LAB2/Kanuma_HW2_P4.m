%   Clearing the workspace
close all 
clear all 
clc

%% Defining an anonymous function as we did in P1
g=@(t) 3.*pi.*sin(8.*pi.*t+1.3).*cos(4.*pi.*t-0.8).*exp(sin(12.*pi.*t));

%% Setting the timeframe
t = 0.25:0.01:0.75;

%% Calculating the energy and power
Energy = trapz(t, abs(g(t)).^2);

Power = Energy/(t(length(t))-t(1));

%% Printing the values to the console
disp('Energy = ');
disp(Energy);
disp('Power = ');
disp(Power);