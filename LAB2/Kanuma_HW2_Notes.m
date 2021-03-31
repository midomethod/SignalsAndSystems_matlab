%   Clearing the workspace
close all 
clear all 
clc

x=@(t) t.^2;            % Anonymous function

t=[1,2,3,4];

y=x(t);

disp(y);

figure(1);
plot(t,x(t));
xlabel('time t');
ylabel('x(t)');

figure(2);
%subplot(row,col,plot#);
    %plot(t,x(t));

    
%% Integration in MATLAB: trapezoid

Q = trapz(t,x); % Pretty much does the approx. of an integral for you

%% Signal Energy

    % E(t1,t2)=int(t1,t2,abs(x(t)).^2)
    % E = trapz(t, abs(x(t)).^2;
    
%% Signal Power

    % P(t1,t2) = E(t1,t2)/(t2-t1)
    
%% Piece-wise functions

    % t=-2:0.1:2;
    % ind = t<0;                % DOES NOT HAVE TO BE NAMED "ind"
    % x(ind) = cos(t(ind));
    % ind = t>=0 & t<1;
    % x(ind) = 1;
    % ind = t>= 1;
    % x(ind) = sin(t(ind);








