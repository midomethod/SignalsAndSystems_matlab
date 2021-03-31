close all
clear all
clc

t = -0.1:0.001:0.1;             % Define t on -0.1 to 0.1 and the steps were made much smaller than usual

h = 400*exp(-200.*t).*cos(400*pi.*t).*(t>=0);                   % The h as given

x = (cos(100*pi.*t)+sin(400*pi.*t)-cos(800*pi.*t)).*(t>=0);     % x as given
w = sin(400*pi.*t);                                             % w(t) as given

%% The convolution y = x*h
y = conv(x,h,'same');

% Plotting all of them
figure(1);
subplot(3,1,1);
    plot(t,y);
    xlabel('t');
    ylabel('output = y');
subplot(3,1,2);
    plot(t,x);
    xlabel('t');
    ylabel('input = x');
subplot(3,1,3);
    plot(t,w);
    xlabel('t');
    ylabel('w(t)');

