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

st = regionprops(I, 'Centroid'); %extraction des centroid des différents points
c = vertcat(st.Centroid); % extraction des coordonnées et mise en matrice N*2
distances = pdist(c); % Matrices des distances entre tous les centroids
link = linkage(distances,'single');
clust = cluster(link,'cutoff',60,'criterion','distance'); % Assignation d'un index de cluster à chaque centre
figure
scatter(c(:,1),c(:,2),10,clust);
axis equal
M = mode(clust); % Obtention de l'index du plus gros cluster
big_c = zeros(1,2); % Extraction des points du plus gros cluster
for i=1:length(c)
    if clust(i) == M
        big_c=[big_c;c(i,:)];
    end
end
[big_c_max,maxIdx]=max()