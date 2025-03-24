Noise = randn([1 22050]);
NoiseOutput = Noise/max(abs(Noise));

audiowrite('Noise.wav', NoiseOutput, 22050);