close all
clear
clc
name_image = "braille_scan_01";
I = imread("raw_data/"+name_image,'jpg');
% Converts RGB to grayscale if image is RGB.
I=RGB2gray(I);   
l=graythresh(I);
bw=imbinarize(I,l);
bw=imcomplement(bw);
I2 = xor(bwareaopen(bw,0),bwareaopen(bw,50));
imwrite(I2,"treated_data/bw_"+name_image+".jpg");
