clc;
clear;
close all;

I = imread('Image/gray.png');
I = imnoise(I, 'gaussian');
subplot(2,2,1);
imshow(I);
title('orignal image');

lpf3x3 = 1/16 .* ([1;2;1] * [1 2 1]);
lpf5x5 = 1/256 .* ([1;4;6;4;1] * [1 4 6 4 1]);
lpf7x7 = 1/4356 .* ([1;6;16;20;16;6;1] * [1 6 16 20 16 6 1]);

% smoothen image using 3x3 filter
J = convolution_2D(lpf3x3, I);
subplot(2,2,2);
imshow(J);
title('3x3 smoothen image');

% smoothen image using 5x5 filter
J = convolution_2D(lpf5x5, I);
subplot(2,2,3);
imshow(J);
title('5x5 smoothen image');

% smoothen image using 7x7 filter
J = convolution_2D(lpf7x7, I);
subplot(2,2,4);
imshow(J);
title('7x7 smoothen image');