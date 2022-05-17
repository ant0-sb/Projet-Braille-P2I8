%Objctif : Modification de l'image de orginiale pour permettre plus tard une reconaissance plus facile
clc
clear
close all
name_image = "braillePierre";
I = imread("raw_data/"+name_image,'jpg');
if ndims(I)==3
    I = rgb2gray(I); 
end
SE = strel('disk',12);
I = imbothat(I,SE); % On égalise l'éclairage de la photo
I = imbinarize(I,"global"); % On tranforme en 0 et 1 avec Otsu
I = bwareaopen(I,8); % On enlève les petits points de lumières
SE = strel('line',5,0);
I = imdilate(I,SE); % On tranforme les ombres en points (carrés)
imwrite(I,"treated_data/bw_"+name_image+".tif");