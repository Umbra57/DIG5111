y = 0;
Filename = 'piano_middle_C.wav';
[Sig, Fs] = audioread(Filename);

Samples = length(Sig);
Duration = Samples/Fs;
info = audioinfo('piano_middle_C.wav');

Ts = 1/Fs;
Time = 0:Ts:Duration-Ts;
Time = Time';

Maximum = max(abs(Sig));
Scalar = 1/Maximum;
for i = 1:Samples
    Sig(i) = Sig(i)*Scalar;
end

plot(Time,Sig)
ylabel('Amplitude')
xlabel('Time in Sec')

Reverse = zeros([Samples 1]);
for i = 1:Samples
    Reverse(i) = Sig(Samples+1-i);
end
audiowrite('Reverse.wav', Reverse, Fs);


 
% % Stereo_File = zeros([Samples 2])
% for i = 1:Samples
%     Stereo_File(i,1) = Sig(i);
%     Stereo_File(i,2) = Sig(i);
% end

Stereo_File = [sig , sig]


% audiowrite('Stereo_File.wav', Stereo_File, Fs);