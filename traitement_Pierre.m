clc;
clear all;
close all;
figure; im0 = imread ('braillePierre.jpg');
im1 = rgb2gray(im0);
imshow(im1)
figure; 
BW = imbinarize(im1, 0.7);
BW = imcomplement (BW);
%BW = abs(1-BW);
BW = imdilate (BW, strel('disk',1));
BW1 = bwpropfilt(BW,'Area', [0 50]);
%BW = imerode (BW, strel ('square', 3));
%BW = imdilate (BW, strel('disk',2));
BW2 = xor(bwareaopen(BW,0),  bwareaopen(BW,50));
%BW = convhull(~BW);
imshowpair(BW1,BW2, 'montage')

BW1short = BW1 (50:1500, 80:1000);
figure; imshow(BW1short)

%figure; im0 = imread ('braillePierre2.jpg');
%im1 = rgb2gray(im0);
%imshow(im1)
%figure;
%BW = imbinarize(im1);
%BW = imcomplement (BW
