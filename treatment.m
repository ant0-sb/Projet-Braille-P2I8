close all
clear
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
imwrite(BWzoom,"treated_data/bw_"+name_image+".jpg");
st = regionprops(BWzoom, 'Centroid'); %structure = matrice de classe
c = vertcat(st.Centroid);
x_centroids = c(:,1);
y_centroids = c(:,2);
imshow(BWzoom); hold on;
%Affichage des centroids
% line(x_centroids,y_centroids, 'LineStyle','none', 'Marker','+', 'Color','b')
ligne_x = [x_centroids(25)];
ligne_y = [y_centroids(25)];

for j=(1:length(y_centroids))
    if abs(y_centroids(25)-y_centroids(j)) < 4
        ligne_x(end+1) = x_centroids(j);
        ligne_y(end+1)= y_centroids(j);
    end
end
plot(ligne_x,ligne_y,'LineStyle','none', 'Marker','+', 'Color','b')

