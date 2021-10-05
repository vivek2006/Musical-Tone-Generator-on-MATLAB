clc;
clear all;
close all;
FS=44100;

% generate frequencies of notes contained in the vector frequency_list
% index : 1 2 3 4 5 6 7 8 9 10 11 12
% note : C4 C#4 D4 D#4 E4 F4 F#4 G4 G#4 A4 A#4 B4
% index : 13 14 15 16 17 18 19 20 21 22 23 24 25
% note : C5 C#5 D5 D#5 E5 F5 F#5 G5 G#5 A5 A#5 B5 C6
nn = 40:64;
frequency_list = 2.^((nn-49)/12)*440;

% define a simple tune
note = [10,12,10,8,5,3,5,8,10,8,10,12,10,8,5,3,5,8,13,12,10,12,10,8,5,3,5,8,10,8,13,12,10,12,10,8,5,8,10,8,13,12,10,10];
secs = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]/4;

y = [];
for kk=1:length(note)
frequency = frequency_list(note(kk));
samples = linspace(0,secs(kk),FS*secs(kk));
sounds = sin(2*pi*frequency*samples);
y = [y , sounds , zeros(1,400)];
end

% play the signal
sound(y,FS)
