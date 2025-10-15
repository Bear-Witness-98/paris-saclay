clc;
clear all;
close all;

% compute sawtooth signal for initial interval
dt = 2/100;
T = 1;
t = -T/2:dt:T/2-dt; % Time vector
a = 2;
x = a*t; % Signal

% copy over different period
t_0_5 = 0:dt:5*T-dt;
x_0_5 = sawtooth(2*pi*1*(t_0_5-.5));

% plot sawtooth signal
figure
plot(t_0_5, x_0_5)
title('Sawtooth signal')
exportgraphics(gcf,'simple_sawtooth.pdf','ContentType','vector')

% print the mean value for the signal.
% this is different from 0 because we have exactly one
% more value of the function below zero than above
mean(x_0_5);


% Create the first few sine components of the sawtooth
b_1 = ((-1)^(1+1) * (a*1)) / (T * pi * 1);
b_2 = ((-1)^(2+1) * (a*1)) / (T * pi * 2);
b_3 = ((-1)^(3+1) * (a*1)) / (T * pi * 3);
b_4 = ((-1)^(4+1) * (a*1)) / (T * pi * 4);
sine_1 = b_1 * sin((2*pi/T)*1*t_0_5);
sine_2 = b_2 * sin((2*pi/T)*2*t_0_5);
sine_3 = b_3 * sin((2*pi/T)*3*t_0_5);
sine_4 = b_4 * sin((2*pi/T)*4*t_0_5);

% compute some convenient sums
sine_1_2 = sine_1 + sine_2;
sine_1_2_3 = sine_1 + sine_2 + sine_3;
sine_1_2_3_4 = sine_1 + sine_2 + sine_3 + sine_4;

% comput the power of the signals
fprintf("The power for signal sawtooth is %.4f\n", cov(x_0_5))
fprintf("The power for signal sine_1 is %.4f\n", cov(sine_1))
fprintf("The power for signal sine_2 is %.4f\n", cov(sine_2))
fprintf("The power for signal sine_3 is %.4f\n", cov(sine_3))
fprintf("The power for signal sine_4 is %.4f\n", cov(sine_4))
fprintf("The power for signal sine_1_2 is %.4f\n", cov(sine_1_2))
fprintf("The power for signal sine_1_2_3 is %.4f\n", cov(sine_1_2_3))
fprintf("The power for signal sine_1_2_3_4 is %.4f\n", cov(sine_1_2_3_4))

fprintf("Compare power of the components with their corresponding coefficient squared over two.")

fprintf("coefficient (1/2)*b_1^2 = %.4f\n", (1/2)*(b_1^2))
fprintf("coefficient (1/2)*b_2^2 = %.4f\n", (1/2)*(b_2^2))
fprintf("coefficient (1/2)*b_3^2 = %.4f\n", (1/2)*(b_3^2))
fprintf("coefficient (1/2)*b_4^2 = %.4f\n", (1/2)*(b_4^2))

% These are almost the same. The differences should be due to numerical
% approoximations.
figure
plot(t_0_5, x_0_5)
hold on
plot(t_0_5, sine_1)
hold on
plot(t_0_5, sine_1_2)
hold on
plot(t_0_5, sine_1_2_3)
hold on
plot(t_0_5, sine_1_2_3_4)
title('Sawtooth signal')
legend({'y = s','y = s1','y = s1 + s2','y = s1 + s2 + s3','y = s1 + s2 + s3 + s4'},'Location','southwest')
exportgraphics(gcf,'sawtooth_approx.pdf','ContentType','vector')

% This  graph represents the DFT of the sinewaves, along with the DFT of
% the sawtooth function they come from. It is noticed that the spectrum of
% the sinewaves DFT match the first few harmonics of the sawtooth, which is
% expected as the sines were computed for this exact reason.
Te = 0.02;
s = x_0_5;
figure
plot(linspace(-1/(2*Te),1/(2*Te),length(s)),fftshift(abs(fft(s))))
hold on
F=linspace(-1/(2*Te),1/(2*Te),length(s));
Spectre=fftshift(abs(fft(sine_1+sine_2+sine_3+sine_4)));
plot(F,Spectre,'r')

exportgraphics(gcf,'spectre_of_sawtooth_aprox.pdf','ContentType','vector')


