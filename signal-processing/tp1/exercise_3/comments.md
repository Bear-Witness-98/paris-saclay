# Exercise 1.3

## Exercise 1.3.1

Image of the plot can be seen in `exponential_function.pdf`

## Exercise 1.3.2

Calculations can be seen in `image_1_3.jpeg`

Plotted function can be seen in `analytical_ft.pdf`

As per the output of the program:
The value of the spectrum's modulus at 1Hz is 0.1517

## Exercise 1.3.3

Plot of the function can be seen in `numerical_ft.pdf`

Comparison without normalisation can be seen in `unnormalised_comparison.pdf`
Comparison with normalisation can be seen in `normalised_comparison.pdf`

The value of the spectrum's modulus at 1Hz is 0.1701

The difference is because of numerical approxiamtions and that in the 
second case (the fft) we have some amount of overlapping, as we must
choose a sampling period for proper digital representation, and the
original signal has unbounded spectrum.

## Exercise 1.3.4

The comparisson of multiple plots can be seen in
`multiple_sampling_period_comparisson.pdf`. Here we see that as the
sampling period increases, the sampling frequency value decreases
(thus the fact that the graphs seem to be clustering into the middle line).
Moreover, as the frequency decreases, the amount of overlap increases, reason
for the graphs to be higher as their domain shrinks.