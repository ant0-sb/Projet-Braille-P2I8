close all;clear;
set(gcf, 'WindowState','maximized');

I = imread('braille_scan.jpg','jpeg');
I=rgb2gray(I);
subplot(1,3,1)
imshow(I)
l=graythresh(I);
bw=imbinarize(I,l);
bw=imcomplement(bw);
subplot(1,3,2)
imshow(bw);
%impixelregion
I2 = imerode(bw,strel('square',4));
I2 = imdilate(bw,strel('diamond',1));

subplot(1,3,3)
imshow(I2);
