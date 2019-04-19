clear;
close all;
clc;

im = imread('Image/gray.png');
him = histtf(im); % histogram equilization

% plot the original image
subplot(2,2,1);
histogram(im);
subplot(2,2,2);
imshow(im);

% plot the histogram equilized image
subplot(2,2,3);
histogram(him);
subplot(2,2,4);
imshow(him);