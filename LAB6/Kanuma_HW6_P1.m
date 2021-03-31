close all
clear all
clc

%%  Part A
R = 10000;              % 10 kilo ohm
C = 133/1000000000;     % 133 nano faraday
f_drop = 1/(4*pi*R*C);  % Evaluates to 60 Hz

m = [0.8, 0.9];         % The two values of m

f = linspace(0,200,100);    % Using only hundred points so stem plot is viable
w = 2*pi*f;                 % calculating w based on f

H_w_1 = [];
for ii = 1:length(w)
    H_w_1(ii) = (1+m(1)).*((2j.*R.*C.*w(ii)).^2+1)/((2j.*R.*C.*w(ii)).^2+4.*(1-m(1)).*1j.*R.*C.*w(ii)+1);
end

H_w_2 = [];                 % Initialize empty
for ii = 1: length(w)       % Evaluate H as specified in assignment
    H_w_2(ii) = (1+m(2)).*((2j.*R.*C.*w(ii)).^2+1)/((2j.*R.*C.*w(ii)).^2+4.*(1-m(2)).*1j.*R.*C.*w(ii)+1);
end

%%  Plotting the magnitude and phase spectrum of H(w)
figure(1);
subplot(2,1,1);
    stem(f,abs(H_w_1));
    xlabel('f');
    ylabel('|H(w)|,m=0.8');
subplot(2,1,2);
    stem(f,(angle(H_w_1)));
    xlabel('f');
    ylabel('\angleH(w),m=0.8');
    
figure(2);
subplot(2,1,1);
    stem(f,abs(H_w_2));
    xlabel('f');
    ylabel('|H(w)|,m=0.9');
subplot(2,1,2);
    stem(f,angle(H_w_2));
    xlabel('f');
    ylabel('\angleH(w),m=0.9');



%%  Part B
load ecg_signal.mat;        % Loading the specified signal

x_t = ecg;

figure(3);
subplot(4,1,1);
    plot(t,x_t);
    xlabel('t');
    ylabel('x(t)');

f = linspace(-250,250,1250);
w = 2*pi*f;

H_w = [];       % Constructing the transfer function for w @ m = 0.9
for ii = 1: length(w)
    H_w(ii) = (1+m(2)).*((2j.*R.*C.*w(ii)).^2+1)/((2j.*R.*C.*w(ii)).^2+4.*(1-m(2)).*1j.*R.*C.*w(ii)+1);
end

    %% Evaluate X(w)
    dT = t(2)-t(1);
    T = dT*(length(t)-1);
    
    X_w = fftshift(fft(x_t))*dT/T; %X(w)
    
    subplot(4,1,2);
        plot(f,X_w);
        xlabel('f');
        ylabel('X(f)');

%% Evaluate Z(w)=H(w)*X(w)
    Z_w = H_w.*X_w;
    
    subplot(4,1,3);
        plot(f,Z_w);
        xlabel('f');
        ylabel('Z(f)');
        
%% Use ifft to find z(t)
z_t = fftshift(ifft(ifftshift(T*Z_w)))/dT;

subplot(4,1,4);
    plot(t,z_t);
    xlabel('t');
    ylabel('z(t)');

save('HW6_P1');     % Save workspace for later use    
