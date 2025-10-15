clc
clear all;
close all;

% create main signal
% time base
ts = .1;
T = 10;
t = 0:ts:T-ts;
% frequency base
fs = 1/ts;
N = length(t);
df = fs/N;
f = -fs/2:df:fs/2-df;
% amplitud data
a = 2;
y = exp(-a*t);

% plot
figure
plot(t, y)
exportgraphics(gcf,'exponential_function.pdf','ContentType','vector')

% Create analitical FT of the signal
% Get module and phase from analytical FT of the function
Y = 1 ./ (a + 1i*(2*pi*f));
Y_mod = abs(Y); % = 1 ./ sqrt(a^2 + (2*pi*f).^2)
Y_arg = unwrap(angle(Y)); % = atan (2*pi*f/a)

% get the value at 1 Hz
idx_1hz = find(f == 1);
fprintf("The value of the spectrum's modulus at 1Hz is %.4f\n", Y_mod(idx_1hz))

% plot module and argument
figure
subplot(2,1,1)
plot(f,Y_mod)
title('Magnitude')
subplot(2,1,2)
plot(f,Y_arg)
title('Phase')
exportgraphics(gcf,'analytical_ft.pdf','ContentType','vector')


% compute the numerical FF (FFT) of the signal
% Get module and phase from FFT
Y_fft = fftshift(fft(y));
Y_fft_mod = abs(Y_fft);
Y_fft_arg = unwrap(angle(Y_fft));


% get the value at 1 Hz
idx_1hz = find(f == 1);
fprintf("The value of the spectrum's modulus at 1Hz is %.4f\n", Y_fft_mod(idx_1hz)/fs)

% plot module and argument
figure
subplot(2,1,1)
plot(f, Y_fft_mod)
title('Magnitude')
subplot(2,1,2)
plot(f, Y_fft_arg)
title('Phase')
exportgraphics(gcf,'numerical_ft.pdf','ContentType','vector')


% compare both signals
% un-nornamilzed
figure
subplot(2,1,1)
plot(f, Y_mod, f, Y_fft_mod)
title('Magnitude')
subplot(2,1,2)
plot(f, Y_arg, f, Y_fft_arg)
title('Phase')
exportgraphics(gcf,'unnormalised_comparison.pdf','ContentType','vector')

% normalized figure
figure
subplot(2,1,1)
plot(f, Y_mod, f, Y_fft_mod/fs)
title('Magnitude')
subplot(2,1,2)
plot(f, Y_arg, f, Y_fft_arg)
title('Phase')
exportgraphics(gcf,'normalised_comparison.pdf','ContentType','vector')

fprintf("The difference between these values is: %.4f\n", abs( Y_fft_mod(idx_1hz)/ts -  Y_mod(idx_1hz)))

% repeat for ts = .5 and ts = .01
% time base .5
ts = .5;
T = 10;
t = 0:ts:T-ts;
% frequency base
fs_5 = 1/ts;
N = length(t);
df = fs_5/N;
f_5 = -fs_5/2:df:fs_5/2-df;
% amplitud data
a = 2;
y = exp(-a*t);

% Get module and phase from FFT
Y_fft = fftshift(fft(y));
Y_fft_mod_5 = abs(Y_fft);
Y_fft_arg_5 = unwrap(angle(Y_fft));

% time base .01
ts = .01;
T = 10;
t = 0:ts:T-ts;
% frequency base
fs_01 = 1/ts;
N = length(t);
df = fs_01/N;
f_01 = -fs_01/2:df:fs_01/2-df;
% amplitud data
a = 2;
y = exp(-a*t);

% Get module and phase from FFT
Y_fft = fftshift(fft(y));
Y_fft_mod_01 = abs(Y_fft);
Y_fft_arg_01 = unwrap(angle(Y_fft));

% plot against previous computations
figure
subplot(2,1,1)
plot(f, Y_mod, f, Y_fft_mod/fs, f_5, Y_fft_mod_5/fs_5, f_01, Y_fft_mod_01/fs_01)
title('Magnitude')
subplot(2,1,2)
plot(f, Y_arg, f, Y_fft_arg, f_5, Y_fft_arg_5, f_01, Y_fft_arg_01)
title('Phase')
exportgraphics(gcf,'mulitple_sampling_period_comparison.pdf','ContentType','vector')

