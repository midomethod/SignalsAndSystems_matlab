%   Clearing the workspace
close all 
clear all 
clc

t = -20:0.01:20;

x=@(t) t.*exp(-0.15.*t); % defining an anonymous function

y   = x(t);             % The function itself
y_e = (x(t)+x(-t))/2;   % The even decomposition of x       
y_o = (x(t)-x(-t))/2;   % The odd decompisition of x
y_s = y_e + y_o;        % The sum of the odd and even decomposition

% Plot everything
figure(1);
subplot(2,2,1);
    plot(t,y);
    xlabel('t');
    ylabel('x(t)');
subplot(2,2,2);
    plot(t,y_e);
    xlabel('t');
    ylabel('x_e(t)');
subplot(2,2,3);
    plot(t,y_o);
    xlabel('t');
    ylabel('x_o(t)');
subplot(2,2,4);
    plot(t,y_s);
    xlabel('t');
    ylabel('y(t)');






