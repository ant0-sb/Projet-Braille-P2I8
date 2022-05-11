clc
clear
close all
I = imread("treated_data\bw_braillePierre.tiff");
st = regionprops(I, 'Centroid'); %structure = matrice de classe
c = vertcat(st.Centroid);
x_centroids = c(:,1);
y_centroids = c(:,2);
imshow(I); hold on;
%Affichage des centroids
%line(x_centroids,y_centroids, 'LineStyle','none', 'Marker','+', 'Color','b')

ligne_x = [x_centroids(25)];
ligne_y = [y_centroids(25)];

for j=(1:length(y_centroids))
    if abs(y_centroids(25)-y_centroids(j)) < 4
        ligne_x(end+1) = x_centroids(j);
        ligne_y(end+1)= y_centroids(j);
    end
end
plot(ligne_x,ligne_y,'LineStyle','none', 'Marker','+', 'Color','b')