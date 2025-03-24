% Main script to be run

[File1, location1] = uigetfile('*.wav','Select the files to compare','MultiSelect','on');
audioFile1 = fullfile(location1,File1);
[Sig1, Fs] = audioread(audioFile1);

