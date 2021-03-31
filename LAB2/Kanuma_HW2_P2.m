%   Clearing the workspace
close all 
clear all 
clc

t = -10:0.01:15;    % Defining timeframe

t_a = t+2;          % accounting for the time shifts in parts a-d
t_b = t-3;
t_c = -t;
t_d = 4-t;

% x(t)
for i = 1:1:length(t)
    x(i) = HW2_P2_function(t(i));
end
% part a
for i = 1:1:length(t)
    x_a(i) = HW2_P2_function(t_a(i));
end
% part b
for i = 1:1:length(t)
    x_b(i) = HW2_P2_function(t_b(i));
end
% part c
for i = 1:1:length(t)
    x_c(i) = HW2_P2_function(t_c(i));
end
% part d
for i = 1:1:length(t)
    x_d(i) = -3.*HW2_P2_function(t_d(i));
end

%% Plot everything
figure(1);
plot(t,x);
xlabel('t');
ylabel('x(t)');

figure(2);
subplot(2,2,1);
    plot(t,x_a);
    xlabel('t');
    ylabel('x(t+2)');
subplot(2,2,2);
    plot(t,x_b);
    xlabel('t');
    ylabel('x(t-3)');
subplot(2,2,3);
    plot(t,x_c);
    xlabel('t');
    ylabel('x(-t)');
subplot(2,2,4);
    plot(t,x_d);
    xlabel('t');
    ylabel('-3*x(4-t)');





