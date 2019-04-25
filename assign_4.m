clc;
clear;
close all;

I = imread('Image/gray.png');
subplot(3,2,1);
imshow(I);
title('original image');

l = length(I(:,1));
h = length(I(1,:));
J = reshape(I,[1,l*h]);

% Negative transformation
T = 256 - J;
subplot(3,2,2);
imshow(reshape(T,[l,h]));
title('negative transformation');

% Log transformation
T = uint8(256 .* log(1 + double(J)) ./ log(256));
subplot(3,2,3);
imshow(reshape(T,[l,h]));
title('log transformation');

% Antilog transformation
T = uint8(256.*(10 .^ ((double(J)./256) - 1)));
subplot(3,2,4);
imshow(reshape(T,[l,h]));
title('antilog transformation');

% Gamma transformation
gamma = 1.5;
T = uint8((256 ^ (1-gamma)) .* (double(J) .^ gamma));
subplot(3,2,5);
imshow(reshape(T,[l,h]));
title('gamma > 1 transformation');

% Gamma transformation
gamma = 0.5;
T = uint8((256 ^ (1-gamma)) .* (double(J) .^ gamma));
subplot(3,2,6);
imshow(reshape(T,[l,h]));
title('gamma < 1 transformation');
