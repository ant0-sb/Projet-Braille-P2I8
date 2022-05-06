close all
clear
clc
name_image = "braille_scan_01";
im0 = imread("raw_data/"+name_image,'jpg');
im1 = rgb2gray(im0); 
BW = imbinarize(im1, 0.7);
BW = imcomplement (BW);
BW = imdilate (BW, strel('disk',1));
BW1 = bwpropfilt(BW,'Area', [0 50]);
BW2 = xor(bwareaopen(BW,0),  bwareaopen(BW,50));

BW1short = BW1 (50:1500, 80:1000);
imwrite(BW1short,"treated_data/bw_"+name_image+".jpg");
