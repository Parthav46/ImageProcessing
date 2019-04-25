clear;
close all;
clc;

im = imread('Image/gray.png');
x = imres(im,2);
imshow(x);
