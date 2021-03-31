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
%% Evaluating m(t) = convolution of g(t)*h(t)
m = conv(g,h,'same');

%% Signal Energy

 E_1 = trapz(t, abs(m).^2);
 disp('Energy of m(t) is:');
 disp(E_1);
 % Parceval's theorem says the int(X(w)^2) = 2pi*int(x(t)^2)
  E_2 = 2*pi*E_1;
 disp('Energy of M(w) is:');
 disp(E_2);
 