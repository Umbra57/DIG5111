X = note(0,49,0.05);
Te = note(0,49,0.1);
C3=horzcat(note(0.5, 28 ,0.1),X);
D3=horzcat(note(0.5, 30 ,0.1),X);
E3=horzcat(note(0.5,32,0.1),X);
F3=horzcat(note(0.5,33,0.1),X);
Gb3=horzcat(note(0.5,34,0.1),X);
G3=horzcat(note(0.5,35,0.1),X);
Ab3=horzcat(note(0.5,36,0.1),X);
A3=horzcat(note(0.5,37,0.1),X);
Bb3=horzcat(note(0.5,38,0.1),X);
B3=horzcat(note(0.5,39,0.1),X);
C4=horzcat(note(0.5,40,0.1),X);
Db4=horzcat(note(0.5,41,0.1),X);
D4=horzcat(note(0.5,42,0.1),X);
E4=horzcat(note(0.5,44,0.1),X);
F4=horzcat(note(0.5,45,0.1),X);
Gb4=horzcat(note(0.5,46,0.1),X);
G4=horzcat(note(0.5,47,0.1),X);
Ab4=horzcat(note(0.5,48,0.1),X);
A4=horzcat(note(0.5,49,0.1),X);
Bb4=horzcat(note(0.5,50,0.1),X);
B4=horzcat(note(0.5,51,0.1),X);
C5=horzcat(note(0.5,52,0.1),X);
D5=horzcat(note(0.5,54,0.1),X);
Eb5=horzcat(note(0.5,55,0.1),X);
E5=horzcat(note(0.5,56,0.1),X);
F5=horzcat(note(0.5,57,0.1),X);
Gb5=horzcat(note(0.5,58,0.1),X);
G5=horzcat(note(0.5,59,0.1),X);
A5=horzcat(note(0.5,61,0.1),X);
C6=horzcat(note(0.5,64,0.1),X);

Snare = horzcat(noise(0.3,0.1),X);
Hats = horzcat(noise(0.3,0.05),Te);
Kick = horzcat(note(0.9,16,0.05),Te);
Sn = Snare/max(abs(Snare))
Ha = Hats/(3*max(abs(Hats)))

Z = note(0,49,0.05);
Y = note(0,49,0.15);
W = note(0,49,0.3);
V = note(0,49,0.6);

A = E5+Gb4+D3;
B = C5+Gb4+D3;
C = G5+B4+G4;
D = G3+G4;
E = G3+E4+C5;
F = E3+C4+G4;
G = C3+C4+E4;
H = F3+C4+A4;
I = G3+D4+B4;
J = Gb3+Db4+Bb4;
K = F3+C4+A4;
L = E3+C4+G4;
M = C4+G4+E5;
N = E4+B4+G5;
O = F4+C4+A5;
P = D4+A4+F5;
Q = E4+B4+G5;
R = C4+A4+E5;
S = A3+E4+C5;
T = B3+F4+D5;
U = G3+D4+B4;


Bar1 = horzcat(A,A,Y,A,Y,B,A,Y,C,Y,W,D,Y,W);
Bar2 = horzcat(E,W,F,W,G,W,H,Y,I,Y,J,K,Y);
Bar3 = horzcat(L,Z,M,Z,N,Z,O,Y,P,Q,Y,R,Y,S,T,U,W);
Bar4Bass = horzcat(C3,W,G3,W,C4,Y,F3,W,C4,C4,Y,F3,Y);
Bar4Top = horzcat(W,E5+G5,Eb5+Gb5,D5+F5,B4+Eb5,Y,C5+E5,Y,E4+G4,F4+A4,G4+C5,Y,C4+A4,E4+C5,F4+D5);
Bar4 = Bar4Bass+Bar4Top(1:105860);
Bar5Bass = horzcat(C3,W,E3,W,G3,C4,Y,G4,Y,G4,G4,Y,G3,Y);
Bar5Top = horzcat(W,E5+G5,Eb5+Gb5,D5+F5,B4+Eb5,Y,C5+E5,Y,C6+F5,Y,C6+F5,C6+F5,Y,W);
Bar5 = Bar5Bass+Bar5Top;
Bar6Bass = horzcat(C3,Y,Ab3,W,Bb3,W,C4,W);
Bar6Top = horzcat(W,Eb5+Ab4,W,F4+D5,W,E4+C5,W);
Bar6 = Bar6Top+Bar6Bass(1:72775);
SnPat = horzcat(V,Sn,Y,W,V,Sn,Y,W);
KickPat = horzcat(Kick,Y,W,V,Kick,Y,W,V);
HaPat1 = horzcat(W,Ha,Z,Ha,Z,Y,Z,Ha,Z,Ha,Z,Y,Z,Ha,Z,Ha,Z,Y,Z,Ha,Z,Ha)
HaPat = HaPat1(1:105862); 
SnareSong = horzcat(SnPat,SnPat,SnPat,SnPat,SnPat,SnPat,SnPat,SnPat,SnPat);
HatSong = horzcat(HaPat,HaPat,HaPat,HaPat,HaPat,HaPat,HaPat,HaPat,HaPat);
KickSong = horzcat(KickPat,KickPat,KickPat,KickPat,KickPat,KickPat,KickPat,KickPat,KickPat,KickPat);
Song = horzcat(Bar1,Bar2,Bar3,Bar2,Bar3,Bar4,Bar5,Bar4,Bar6)+SnareSong(1:919672)+HatSong(1:919672)+KickSong(1:919672);
SongOutput = Song/max(abs(Song));

for i = 1:SongOutput
    if abs(i)>0.5
        diff=(i-0.5)/2;
        i=diff+0.5;
    end
end

audiowrite('Mario.wav',SongOutput,44100,'BitsPerSample',8);
