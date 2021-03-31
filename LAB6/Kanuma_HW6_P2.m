close all 
clear all
clc

%% Problem 2

%% Import workspace from part 1
load HW6_P1;

% Compute signal energy by integrating the square of the wave
E_x_t = trapz(t,x_t.^2);
E_z_t = trapz(t,z_t.^2);

% Print thos evalues
disp('E(x(t)) =');
disp(E_x_t);
disp('E(z(t)) =');
disp(E_z_t);

%% Since I don't have a good handle on Parseval's theorem, I will use the data imported from previous problem
E_X_w = [];
E_X_w(1) = 0;
for ii = 2:length(w)
    subw = w(1:ii);
    subX = X_w(1:ii);
    E_X_w(ii) = trapz(subw,subX.^2);
end

E_Z_w = [];
E_Z_w(1) = 0;
for ii = 2:length(w)
    subw = w(1:ii);
    subZ = Z_w(1:ii);
    E_Z_w(ii) = trapz(subw,subZ.^2);
end

% Plotting the Energy spectrum
figure(1);
subplot(2,1,1);
    plot(f,E_X_w);
    xlabel('f');
    ylabel('E(X)');
subplot(2,1,2);
    plot(f,E_Z_w);
    xlabel('f');
    ylabel('E(Z)');
