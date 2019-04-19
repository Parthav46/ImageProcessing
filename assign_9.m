clear;
close all;
clc;

Im = imread('Image/gray.png');
Im = imnoise(Im, 'salt & pepper');
subplot(1,2,1);
imshow(Im);
a = medianfilt(Im, 5);
subplot(1,2,2);
imshow(a);