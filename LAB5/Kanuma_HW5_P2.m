close all
clear all
clc

w = -31.4:0.01:31.4;
H = 5*(abs(w)<=20);


G =@(a) 2*((a>=5)-(a>=10)); % Defining an anonymous function G in frequency domain
g = [];                     % Creating an empty array for g(t)
t = -100:0.1:100;           % The time range
for ii = 1:1:length(t)      % Calculating the inverse fourier transform
    g(ii) = (1/(2*pi))*trapz(w,G(w).*exp(1i.*w.*t(ii)));
end

h = [];
for ii = 1:1:length(t)      % Calculating the inverse fourier transform
    h(ii) = (1/(2*pi))*trapz(w,H.*exp(1i.*w.*t(ii)));
end

% Time domain m(t) would be = g(t) convoluted by h(t)
tau = t;
%% Evaluating m(t) = convolution of g(t)*h(t)
m = conv(g,h,'same');
        % at this point, m is the time domain representation of M

%% Converting it to the frequency domain M(w)
dT = t(2)-t(1);
w=linspace(-pi/dT,pi/dT,length(m));
M = [];
for ii=1:length(w)    
    M(ii)=trapz(t,m.*exp(-1i*w(ii)*t));
end

M_mag = abs(M);
M_ph = angle(M);

figure(1);
subplot(2,1,1);
    plot(w,M_mag);
    xlabel('w');
    ylabel('|M(w)|');
subplot(2,1,2)
    plot(w,M_ph);
    xlabel('w');
    ylabel('\angleM(w)');
    
%% Part B

figure(2);
subplot(2,1,1);
    plot(t,real(m));
    xlabel('t');
    ylabel('real part of m(t)');
subplot(2,1,2);
    plot(t,imag(m));
    xlabel('t');
    ylabel('imaginary part of m(t)');

