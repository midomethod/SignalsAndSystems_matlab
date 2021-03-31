close all
clear all
clc

%% signal: x, impulse response: h

% Defining the anonymous functions specified in the assignment
x1=@(t) 5*(t>=0 & t<10);
x2=@(t) 2*x1(t-10);
xlc=@(t) x1(t)+2*x1(t-10);      % xlc stands for x_linear_combination

% The given impulse response function
h=@(t) (exp(-t/4).*cos((31^(1/2)*t)/4) - (31^(1/2)*exp(-t/4).*sin((31^(1/2)*t)/4))/31).*(t>=0);
% Defining the time range, time step, time shift range, and time shift step
dtau = 0.1;  
tau = -10:dtau:40;              
dT=0.5;  
t = -10:dT:40;  

%%  Plotting y1=convolution of x(t)*h(t)
figure (1)
y1 = NaN(1, length (t)); % Populate array with NaNs

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    x1h = h(t(ii)-tau).*x1(tau);                           
    y1(ii)=trapz(tau,x1h);   
  
% plotting 
    subplot (2,1,1)
    plot(tau, x1(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x1(\tau)','h(t-\tau)');
    
    subplot (2,1,2)
    plot (t, y1, 'k', t (ii), y1(ii), 'ok');
    xlabel ('t'); ylabel ('y1(t) = \int x1(\tau)h(t-\tau) d\tau');
    drawnow;

end
    
%% Plotting convolution y2 = x2(t)*h(t)
figure (2)
y2 = NaN(1, length (t)); 

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    x2h = h(t(ii)-tau).*x2(tau);                           
    y2(ii)=trapz(tau,x2h);   
  
% plotting 
    subplot (2,1,1)
    plot(tau, x2(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x2(\tau)','h(t-\tau)');
    
    subplot (2,1,2)
    plot (t, y2, 'k', t (ii), y2(ii), 'ok');
    xlabel ('t'); ylabel ('y2(t) = \int x1(\tau)h(t-\tau) d\tau');
    drawnow;
    
end

%%  Plotting the convolution of the linear combination function
figure (3)
ylc = NaN(1, length (t)); 

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    xlch = h(t(ii)-tau).*xlc(tau);                           
    ylc(ii)=trapz(tau,xlch);   
  
% plotting 
    subplot (2,1,1)
    plot(tau, xlc(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('xlc(\tau)','h(t-\tau)');
    
    subplot (2,1,2)
    plot (t, ylc, 'k', t (ii), ylc(ii), 'ok');
    xlabel ('t'); ylabel ('ylc(t) = \int xlc(\tau)h(t-\tau) d\tau');
    drawnow;
    
end

% Plotting the sum of y1+y2 along with y_linear_combination for comparison
y3 = y1+y2;
figure(4);
subplot(2,1,1);
plot(t,y3);
xlabel('t');
ylabel('y_1+y_2');
subplot(2,1,2);
plot(t,ylc);
xlabel('t');
ylabel('y_lc');



  