close all
clear all
clc

%% Problem 3

fc = 500000;                        % Carrier frequency = 500kHz
fs = fc*10;                         % Sampling frequncy = 10*carrier
fm = fc/10;                         % Message frequency = carrier/10

m = [6,0,4,-6,2];                   % The message to transmit

t = 0 : 1/fs : length(m)/fm-1/fs;   % The time signal
dT = t(2)-t(1);

c =@(t) cos(2*pi*fc*t);          % Specified carrier signal
lo =@(t) cos(2*pi*fc*t+pi/3);    % The local oscillator

c_t = c(t); %carrier signal

m_t = [];   % Initialize empty array
for ii = 1:length(m)
    m_t = [m_t, m(ii)*ones(1,length(t)/length(m))];
end

%% Modulate message signal with carrier
s_t = m_t.*c_t;

figure(1);
subplot(4,1,1);
    plot(t,s_t);
    title('Transmitted signal in time domain');
    xlabel('t');
    ylabel('s(t)');
    
    
%% Frequency domain of signal
S_w = fftshift(fft(s_t,length(s_t))*dT);
w = linspace(-pi,pi,length(S_w))/dT;    % angular frequency
f = w/(2*pi);                           % frequency in Hz

subplot(4,1,2);
    plot(f,abs(S_w));
    title('Transmitted signal magnitude in frequency domain');
    xlabel('f');
    ylabel('|S(w)|');

%% Demodulation
lo_t = lo(t);       % Local oscillator
demod = s_t.*lo_t;  % Demodulate it by multiplying by local oscillator
DEMOD=fftshift(fft(demod,length(demod))*dT);    % Change into frequency domain

Hlpf = [];
for jj = 1:length(f)
    if  abs(f(jj))<fc
        Hlpf(jj) = 2;
    else
        Hlpf(jj) = 0;
    end
end

% Frequency domain demodulation

V0_w = DEMOD.*Hlpf;
v0_t =(ifft(ifftshift(V0_w)))/dT;

subplot(4,1,3);
    plot(t,2*v0_t);
    title('Demodulated and filtered signal in time domain');
    xlabel('t');
    ylabel('v0(t)');
subplot(4,1,4);
    plot(f,abs(V0_w));
    title('Demodulated and filtered signal magnitude in frequency domain');
    xlabel('f');
    ylabel('|V0(f)|');
    
 
    




