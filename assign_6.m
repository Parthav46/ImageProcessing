clear;
close all;
clc;

im = imread('Image/gray.png');
x = imslice(im,8);
for i = 1:8
    subplot(3,3,i);
    imshow(double(x(:,:,i)));
end
