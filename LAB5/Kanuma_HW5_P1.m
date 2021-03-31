close all
clear all
clc

%% Part 1 
G =@(a) 2*((a>=5)-(a>=10)); % Defining an anonymous function G in frequency domain
w = -31.4:0.01:31.4;        % The frequency range
g = [];                     % Creating an empty array for g(t)
t = -100:0.1:100;           % The time range

for ii = 1:1:length(t)      % Calculating the inverse fourier transform
    g(ii) = (1/(2*pi))*trapz(w,G(w).*exp(1i.*w.*t(ii)));
end

g_real = real(g);           % Extracting the real part of g
g_imag = imag(g);           % Getting the imaginary part of g

%% The plots for part a as specified
figure(1);
subplot(3,1,1);
    plot(w,G(w));
    xlabel('w');
    ylabel('G(w)');
subplot(3,1,2);
    plot(t,g_real);
    xlabel('t');
    ylabel('Re{g(t)}'); 
subplot(3,1,3);
    plot(t,g_imag);
    xlabel('t');
    ylabel('Im{g(t)}');    
    
    
    
%% Part b
Y = G(w-5);                 % The frequency-shifted signal Y
y = [];                     % Initializing the time domain signal y

for ii = 1:1:length(t)      % Evaluating the inverse fourier transform on Y
    y(ii) = (1/(2*pi))*trapz(w,Y.*exp(1i.*w.*t(ii)));
end

y_real = real(y);           % Get real part of y
y_imag = imag(y);           % Get imaginary part of y

%% Make the plots for part b
figure(2);
subplot(3,1,1);
    plot(w,Y);
    xlabel('w');
    ylabel('Y(w)');
subplot(3,1,2);
    plot(t,y_real);
    xlabel('t');
    ylabel('Re{y(t)}'); 
subplot(3,1,3);
    plot(t,y_imag);
    xlabel('t');
    ylabel('Im{y(t)}');    