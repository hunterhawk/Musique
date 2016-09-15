clc
clear
%Generates Spectrograms for the audio files
% [signal,fs] = wavread('S:\package\VIII\softcomputing\testData\dogtoo.wav');
 %spectrogram(signal(:,1));
 %axis off
 
 %Generates the features for the audio test files
directory = 'S:\package\VIII\softcomputing\spectrograms\';
files = dir(strcat(directory, '*.*'));
data = [];


i=3;
for i = 3:length(files)
    data = [data; histogram(imread(strcat(directory,files(i).name)), 1)];
end

directory = 'C:\Users\Anusha\Desktop\Audios\audio\movies\spectrograms\';
files = dir(strcat(directory, '*.*'));
for i = 3:length(files)
    data = [data; histogram(imread(strcat(directory,files(i).name)), 2)];
end

