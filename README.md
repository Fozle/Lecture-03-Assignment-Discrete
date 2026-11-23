# Lecture 03 – Convolution and Moving-Average Filtering

## Objective

The objective of this experiment was to create a discrete-time signal, add noise, and investigate signal operations and moving-average filtering using MATLAB.

## Results and Observations

### 1. Amplitude Scaling

I multiplied the noisy signal by 2. The amplitude became twice as large. The signal frequency and sample positions did not change.

### 2. Signal Delay

I delayed the noisy signal by 5 samples by adding five zeros at the beginning. The signal moved to the right by five sample positions. Its shape remained the same.

### 3. Impulse Response

The impulse response h[n] describes how a filter responds to an impulse input. It determines how the filter processes the input signal.

### 4. Convolution

I used MATLAB's conv() function to apply the moving-average filter. Convolution reduced rapid variations and made the noisy signal smoother.

### 5. Comparison of Filter Lengths

The 5-point filter reduced noise while keeping the signal shape close to the clean signal.

The 15-point filter produced stronger smoothing. However, it also reduced the amplitude and removed some useful signal details.

### 6. Which Filter Removed More Noise?

The 5-point filter gave the best result according to the mean squared error values.

- Original noisy signal MSE: 0.1559
- 5-point filter MSE: 0.0359
- 15-point filter MSE: 0.2557

The 5-point filter had the lowest error.

### 7. Effect of the Longer Filter

The 15-point filter removed more rapid variations, but it also distorted the useful signal. It reduced the peaks and made the output too smooth.

### 8. Engineering Recommendation

I recommend the 5-point moving-average filter for this signal. It reduced noise and kept the signal shape closer to the original clean signal.

### 9. Real Engineering Application

Moving-average filtering can be used in industrial condition monitoring. For example, it can reduce noise in temperature or vibration sensor measurements.

## AI Usage

**Tool used:** ChatGPT

**How I used it:** I used ChatGPT to understand MATLAB commands, convolution, moving-average filters, and the assignment requirements.

**What I verified or changed:** I ran the MATLAB code myself, checked all generated figures, and compared the MSE values to evaluate the filters.
