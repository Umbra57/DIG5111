function noteX = note(A, keynum, dur)

Fs = 44100;
Ts = 1/Fs;
A4 = 440;
ref_key = 49;
n = keynum-ref_key;

freq = A4*2^(n/12)
Time = 0:Ts:dur;

noteX = A*sawtooth(2*pi*freq*Time,0.5);
end
