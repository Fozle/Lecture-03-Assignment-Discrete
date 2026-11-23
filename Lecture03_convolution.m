
clear;
close all;
clc;

% Use the same random noise each time
rng(1);

%% Create a clean discrete-time signal

n = 0:100;
clean = sin(0.1*pi*n);

%% Add noise

noise = 0.4*randn(size(n));
measured = clean + noise;

%% Display clean and noisy signals

figure(1);

plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.6 0.6 0.6]);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Clean and Noisy Signals');
legend('Clean Signal', 'Noisy Signal');
hold off;

%% Task 1: Amplitude Scaling

scaled = measured * 2;

figure(2);

plot(n, measured, 'b', 'LineWidth', 1.2);
hold on;
plot(n, scaled, 'r', 'LineWidth', 1.2);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Amplitude Scaling');
legend('Noisy Signal', 'Scaled Signal');
hold off;

saveas(gcf, 'signal_operations.png');

%% Task 2: Signal Delay

delay = 5;

delayed = [zeros(1, delay), measured];

n_measured = 0:length(measured)-1;
n_delayed = 0:length(delayed)-1;

figure(3);

plot(n_measured, measured, 'b', 'LineWidth', 1.2);
hold on;
plot(n_delayed, delayed, 'r--', 'LineWidth', 1.2);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Signal Delay of 5 Samples');
legend('Original Noisy Signal', 'Delayed Signal');
hold off;

%% Task 3: Five-Point Moving-Average Filter

h5 = ones(1,5)/5;

filtered5 = conv(measured, h5, 'same');

figure(4);

plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.7 0.7 0.7]);
plot(n, filtered5, 'r', 'LineWidth', 1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Five-Point Moving-Average Filtering');
legend('Clean Signal', 'Noisy Signal', 'Filtered Signal');
hold off;

saveas(gcf, 'noise_filtering.png');

%% Task 4: Compare Two Filter Lengths

h15 = ones(1,15)/15;

filtered15 = conv(measured, h15, 'same');

figure(5);

plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.7 0.7 0.7]);
plot(n, filtered5, 'r', 'LineWidth', 1.5);
plot(n, filtered15, 'm--', 'LineWidth', 1.5);

grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Comparison of 5-Point and 15-Point Filters');
legend('Clean Signal', 'Noisy Signal', ...
       '5-Point Filter', '15-Point Filter');
hold off;

saveas(gcf, 'filter_comparison.png');

%% Calculate Noise Error

error_noisy = mean((measured-clean).^2);
error_5 = mean((filtered5-clean).^2);
error_15 = mean((filtered15-clean).^2);

fprintf('\nNOISE FILTERING RESULTS\n');
fprintf('Original noisy signal MSE: %.4f\n', error_noisy);
fprintf('5-point filter MSE: %.4f\n', error_5);
fprintf('15-point filter MSE: %.4f\n', error_15);

fprintf('\nAll figures saved successfully.\n');
