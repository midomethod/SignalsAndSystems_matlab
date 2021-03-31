close all
clear all
clc

%% Defining anonymous function x(t)
    x=@(t) 0.6.*((t>=-2)-(cos(pi.*t)+1).*((t>=-1)-(t>=1))-(t>=2));
%% Time frame specified by the problem
    t = -5:0.1:5;
%% Use the anonymous function to make vector fx
    fx = x(t);
%% Extend t
    t_ext = linspace(t(1),t(1)+3*(t(length(t))-t(1)),3*(length(t)));
%% Extend fx
    fx_ext = repmat(fx,1,3);

%% Plot original signal    
figure(1);
plot(t_ext,fx_ext);
xlabel('t');
ylabel('Original Signal');

%% Plot the reconstructed signal using Kanuma_HW4_P1
Reconst = Kanuma_HW4_P1(fx,t,51,1);
