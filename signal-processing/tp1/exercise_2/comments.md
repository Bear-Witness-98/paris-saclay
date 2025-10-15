# Exercise 1.2

## Exercise 1.2.1

Signal drawn can be seen in file  `simple_sawtooth.pdf`

## Exercise 1.2.2

In images: `image_1_2_a.jpeg` and `image_1_2_b.jpeg`.

## Exercise 1.2.3

In image `image_1_2_b.jpeg`.

## Exercise 1.2.4

Signal drawn can be seen in file `sawtooth_approx.pdf`

We can conclude that by adding up more and more of the
sine commponets of the sawtooth, we get a better approximation.

## Exercise 1.2.5

Output from program:
```Markdown
The power for signal sawtooth is 0.3345
The power for signal sine_1 is 0.2035
The power for signal sine_2 is 0.0509
The power for signal sine_3 is 0.0226
The power for signal sine_4 is 0.0127
The power for signal sine_1_2 is 0.2543
The power for signal sine_1_2_3 is 0.2769
The power for signal sine_1_2_3_4 is 0.2896
Compare power of the components with their corresponding coefficient squared over two.coefficient (1/2)*b_1^2 = 0.2026
coefficient (1/2)*b_2^2 = 0.0507
coefficient (1/2)*b_3^2 = 0.0225
coefficient (1/2)*b_4^2 = 0.0127
```

It can be seen, that the value of a coefficient squared over two
matches (up to some numerical precission) the power of the
corresponding component to that coefficient.
This matches the predicted outcome.

## Exercise 1.2.6

This  graph represents the DFT of the sinewaves, along with the DFT of
the sawtooth function they come from. It is noticed that the spectrum of
the sinewaves DFT match the first few harmonics of the sawtooth, which is
expected as the sines were computed for this exact reason.