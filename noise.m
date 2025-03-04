function noteX = noise(A,dur)

Fs = 44100;
Time = dur*Fs;

noteX = A.*randn([1,Time]);
end