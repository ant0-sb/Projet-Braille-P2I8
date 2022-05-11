%Objectif : Modification de l'image de orginiale pour permettre plus tard une reconaissance plus facile
close all
clear var
clc
name_image = "braillePierre";
im0 = imread("raw_data/"+name_image,'jpg');
if ndims(im0)==3
    im0 = rgb2gray(im0); 
end
BW = imbinarize(im0, 0.7);
BW = imcomplement (BW);
BW = imdilate (BW, strel('disk',1));
BW = bwpropfilt(BW,'Area', [0 50]);
% Equivalent treatment: BW2 = xor(bwareaopen(BW,0),  bwareaopen(BW,50));
BWzoom = BW (50:1500, 80:1000);
%Attention pour les imwrite, ne pas utiliser le format jpg car il ne supporte pas les " binary images as input arrays".
imwrite(BWzoom,"treated_data/bw_"+name_image+"tiff"); %If A is of data type logical, then imwrite assumes that the data is a binary image and writes it to the file with a bit depth of 1, if the format allows it. BMP, PNG, or TIFF formats accept binary images as input arrays.