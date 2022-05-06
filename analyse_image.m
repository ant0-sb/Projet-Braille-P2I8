close all
clear
clc
set(gcf, 'WindowState','maximized');
name_image = "braille_scan";
I = imread("raw_data/"+name_image,'jpg');
I=rgb2gray(I);
imshow(I)
l=graythresh(I);
bw=imbinarize(I,l);
bw=imcomplement(bw);
subplot(1,2,1)
imshow(bw);
%impixelregion
I2 = xor(bwareaopen(bw,0),bwareaopen(bw,50));
subplot(1,2,2)
imshow(I2);
imwrite(I2,"treated_data/bw_"+name_image+".jpg");
