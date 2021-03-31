function [Ck]=Kanuma_HW4_P1(x,t,Nk,p)

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
    Ck(n)=(1/T)*trapz(t,x.*exp(-1i*k(n)*w0*t)); % This is the equation for Ck given
end
        
        
        
%% plot spectrum and reconstructed signal     
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        %
        % % % write this code segment
        %
        
        magnitude = abs(Ck);    % Evaluating the magnitude
        angel = angle(Ck);      % Evaluating the phase for each coefficient
        
        figure();
        subplot(2,1,1);         % Make new figure
            stem(w0*k,magnitude);   % Plot the magnitude on the frequency spectrum
            xlabel('k');
            ylabel('|Ck|');
        subplot(2,1,2);         % Move onto next subplot
            stem(w0*k,angel*180/pi);    % Plot the phase on the freq. spectrum
            xlabel('k');
            ylabel('\angleCk');
           
        % plot 3 cycles of the signal 'x' and the reconstructed signal
        %
        % % % write this code segment
        %
        t_ext = linspace(t(1),t(1)+3*T,3*(length(t)-1)+1);  % Calculating t_ext this way made more sense to me
        reconst = zeros(1,length(t_ext));   % Populate the array with 0s
        
        for n = 1:length(k)     % Reconstruct the signal using the fourier series
            reconst = reconst+Ck(n).*exp(1i*k(n)*w0.*t_ext);
        end
        
        figure();   % Make a new figure
        plot(t_ext,reconst);
        xlabel('extended t');
        ylabel('reconstructed signal');
        
    end
     
end