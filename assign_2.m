clear;
close all;
clc;

im = imread('Image/gray.png');
x = imres(im,8);
imshow(x);
