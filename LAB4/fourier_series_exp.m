function [Ck]=fourier_series_exp(x,t,Nk,p)

% Ck = exponential fourier series cofficient  
% x = single period of a signal
% t = time corrosponding to 'x'
% Nk = (optional input) number of exponential terms
% p = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal  
% dT = t(2)-t(1) = temporal resolution of signal (x)
% T = peiod of signal 'x'
% w0= angular frequency of signal 'x' 


    dT=t(2)-t(1);   % delta T
    T= dT*length(t);    % The period
    w0=2*pi/T;   

    % Check the number of inputs, 'nargin' returns number of input arguments 
    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=10;   % you can set any default value you like 
        p=0;      % not plots
    elseif nargin ==3
        p=0;      % not plots
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6


    %% evaluate Ck
        %
        % % % write this code segment
        %
Ck = [1:length(k)]; % Just preallocating the space
for n =1:length(k)
    The_Exp = exp(1i.*k(n).*w0.*t);
    integrand = x.*The_Exp;
    coef = trapz(t,integrand)/T;
    Ck(n)=coef;
end
        
        
        
%% plot spectrum and reconstructed signal     
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        %
        % % % write this code segment
        %
        
        magnitude = abs(Ck);
        angel = angle(Ck);
        
        figure(1);
        subplot(2,1,1);
            plot(k,magnitude);
            xlabel('k');
            ylabel('|Ck|');
        subplot(2,1,2);
            plot(k,angel);
            xlabel('k');
            ylabel('\angleCk');
           
        % plot 3 cycles of the signal 'x' and the reconstructed signal
        %
        % % % write this code segment
        %
        
        t_ext = linspace(t(1),t(1)+3*T,3*length(t));
        reconst = zeros(1,length(t_ext));
        
        for n = 1:length(Ck)
            addd = Ck(n).*exp()
        end
        
    end
     
end