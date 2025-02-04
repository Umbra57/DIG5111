Amp=0.9;
f = 1000;
fs = 44100;
ts = 1/fs;
t = 0:1/fs:(0.9-ts);
sig = Amp*sin(2*pi*f*t);
sound(sig,fs);
plot(t,sig);
audiowrite('sine1.wav',sig,fs);
