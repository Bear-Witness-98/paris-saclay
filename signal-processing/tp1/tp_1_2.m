clc;
clear all;

% compute sawtooth signal for initial interval
t = -1/2:2/100:1/2-2/100; % Time vector
a = 2;
x = a*t; % Signal

% copy over different period
trailing_samples = length(t)/2;
t_0_5 = cat(2, t, t+1, t+2, t+3, t+4, t+5);
x_0_5 = cat(2, x, x, x, x, x, x);
t_0_5 = t_0_5(trailing_samples+1:(end-trailing_samples));
x_0_5 = x_0_5(trailing_samples+1:(end-trailing_samples));

% plot sawtooth signal
plot(t_0_5,x_0_5)
title('Sawtooth signal')