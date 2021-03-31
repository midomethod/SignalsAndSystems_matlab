%   Clearing the workspace
close all 
clear all 
clc

%% Modeled on timeframe:

t = 0:0.1:200;

%% N-players are trying to get 160Hz but end up getting

f_51    = 159:0.04:161;
f_101   = 159:0.02:161;

%% The function each players generate:

y=@(a,b) 10.*cos(2*pi*a.*b);

%% y_tot_1

y_tot_1 = y(t,f_51(1));

for i= 2:1:length(f_51)
    y_dummy = y(t,f_51(i));
    y_tot_1 = y_tot_1+y_dummy;
end

%% y_tot_2

y_tot_2 = y(t,f_101(1));

for i= 2:1:length(f_101)
    y_dummy = y(t,f_101(i));
    y_tot_2 = y_tot_2+y_dummy;
end

%% Plot them

figure(1);
subplot(2,1,1);
    plot(t,y_tot_1);
    xlabel('t');
    ylabel('y(t) when N = 51');
subplot(2,1,2);
    plot(t,y_tot_2);
    xlabel('t');
    ylabel('y(t) when N = 101');













