[SigSig, Fs] = audioread('Mario.wav');

counter = 0;
Feedback = 3;
Time = 0.3;
Sampletime = Time*Fs;

Decays = zeros(Fs*Feedback,1);
LenDelay = length(Decays);

Delays = zeros(1,Fs*Feedback);

Decays = 1:(-1/(Fs*Feedback)):1/(Fs*Feedback);

for i = 1:length(Delays)
    if Sampletime <= counter
        Delays(i) = Decays(i);
        counter = 0;
    else
        counter = counter + 1;
    end
end

plot(Delays);
Wet = conv(SigSig(:,1), Delays);
audiowrite('MarioDelay.wav',Wet,Fs);
