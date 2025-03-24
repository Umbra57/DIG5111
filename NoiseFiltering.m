
NoiseFs = 44100;
NoiseDur = 4;
Noise = randn([NoiseFs*NoiseDur 1]);
NoiseOutput = Noise/max(abs(Noise));

a = 1;
b = Filter2.numerator;
FilteredNoise = filter(b,a,NoiseOutput);
sound(FilteredNoise,NoiseFs);

for i = 1:FilteredNoise
    if abs(i)>0.5;
        diff=(i-0.5)/2;
        FilteredNoise(i)=diff+0.5;
    end
end
