%x_single_period(t)= 5, 0<t<1 , T=2 
%                   -5, 1<t<2  
%x_periodic(t),     0<t<5T

close all
clear all
clc

%% single period defination
dT=0.01;
t=0:dT:5;
x=t.^3-1i*2*pi.*t.^2;
x_single_period=x;
t_single_period=t; % single period is from 0 to 2


%% period and fundamental angular freq.
T=t(length(t))-t(1);    % I decided to calculate period this way instead
w0=2*pi/T; 


%%



%% replicating single period
number_of_periods=5;
x_extended=repmat(x_single_period,1,number_of_periods);   % 1 row, 5 column: number of periods
% generating new 'time' variable to match signal 'x_extended'
t_extended=linspace(t_single_period(1),t_single_period(1)+(length(x_extended)-1)*...
    (t_single_period(2)-t_single_period(1)),length(x_extended));

    %% Gotta plot the real & imaginary part of original signal
    x_ext_re=real(x_extended);
    x_ext_im=imag(x_extended);
    
figure (1);     % We will plot everything on the same figure
subplot(411)
    plot(t_extended,x_ext_re);
    xlabel('t')
    title('Z_r_e_a_l')
    xlim([0 10])
    hold on; % Putting hold on since we have to come back and plot the reconstructed
subplot(412)
    plot(t_extended,x_ext_im);
    xlabel('t')
    title('Z_i_m_a_g')
    xlim([0 10])
    hold on;    % Putting hold on since we have to come back and plot the reconstruction


%% exponential FS, approximation with 11 terms
k=-25:25; %k=index of harmonics

for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t_single_period, x_single_period.*exp(-1i*k(ii)*w0*t_single_period));
end

w0k=w0*k;  % different hermonic angular frequencies
subplot(413)        % Plot it on the same figure but different subplot
stem(k,abs(Ck))
hold on
% set(gca,'xtick',w0k,'xticklabels',{'-5\omega_0','-4\omega_0',...
%     '-3\omega_0','-2\omega_0','-\omega_0','0','\omega_0',...
%     '2\omega_0','3\omega_0','4\omega_0','5\omega_0'});

legend('Magnitude spectrum  k=-25:25')
xlabel('\omega')

subplot(414)        % And the phase spectrum on the last subplot...
stem(w0k,angle(Ck)*180/pi);
% set(gca,'xtick',w0k,'xticklabels',{'-5\omega_0','-4\omega_0',...
%     '-3\omega_0','-2\omega_0','-\omega_0','0','\omega_0',...
%     '2\omega_0','3\omega_0','4\omega_0','5\omega_0'});
legend('Phase spectrum  k=-25:25')
xlabel('\omega')
ylabel('degrees')

%% signal reconstruction from FS components
% reconstructing 'number_of_periods' cycles


t_reconstracted=linspace(t_single_period(1),t_single_period(1)+...
    (number_of_periods*length(t_single_period)-1)*(t_single_period(2)-t_single_period(1)),...
    number_of_periods*length(x_single_period));

x_reconstracted=zeros(1,length(t_reconstracted));  % initiating with zeros (0)


for ii=1:length(k)
    x_reconstracted=x_reconstracted+Ck(ii)*exp(1i*k(ii)*w0*t_reconstracted);
end

%% But wait, I have to plot the reconstructed signal on top of the original!!!
x_rec_re = real(x_reconstracted);
x_rec_im = imag(x_reconstracted);

subplot(411);   % Plot these over the original signal
    plot(t_reconstracted,x_rec_re);
subplot(412);
    plot(t_reconstracted,x_rec_im);
