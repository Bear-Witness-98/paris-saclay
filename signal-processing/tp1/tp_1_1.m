clc;
clear all;


% computes the DFT of a sum of sines, with the FFT function
t = 0:1/100:10-1/100; % Time vector
x = sin(2*pi*15*t) + sin(2*pi*40*t); % Signal
y = fft(x); % Compute DFT of x
m = abs(y); % Magnitude
y(m<1e-6) = 0; % Removes small values due to numerical precision
p = unwrap(angle(y)); % Phase, unrwraps makes it clear to 

% plots the magnitud and phase of the DFT
f = (0:length(y)-1)*100/length(y); % Frequency vector
subplot(2,1,1)
plot(f,m)
title('Magnitude')
ax = gca; % get current axis
ax.XTick = [15 40 60 85]; % tics for the axis
subplot(2,1,2)
plot(f,p*180/pi) % plot in degrees
title('Phase')
ax = gca;
ax.XTick = [15 40 60 85];

% applies a zero padding to the input signal (x) until
% it has n values, then computes the DFT
n = 512;
y = fft(x,n);
m = abs(y);
p = unwrap(angle(y));
f = (0:length(y)-1)*100/length(y);

subplot(2,1,1)
plot(f,m)
title('Magnitude')
ax = gca;
ax.XTick = [15 40 60 85];
subplot(2,1,2)
plot(f,p*180/pi)
title('Phase')
ax = gca;
ax.XTick = [15 40 60 85];


% Compute back the initial signal
% just the error is computed here, which is in the
% order of 1e-16, which means it is a pretty good 
% approximation.
t = 0:1/255:1;
x = sin(2*pi*120*t);
y = real(ifft(fft(x)));
figure
plot(t,x-y)