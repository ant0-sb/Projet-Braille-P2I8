%Objectif: Trouver les coordonnées des points et les regrouper en ligne
clc
clear
close all
I = imread("treated_data\bw_braillePierre.tiff");
st = regionprops(I, 'Centroid'); %structure = matrice de classe
c = vertcat(st.Centroid);
x_centroids = c(:,1); %Coordonnées X des points détectés
y_centroids = c(:,2); %Coordonnées Y des points détectés
precision_ligne = 3; %Nombre de pixel max entre 2 points d'une même ligne, expérimentalement c'est mieux entre 3 et 4. Voir dossier rapport
precision_col = 8; %Nombre de pixel max entre 2 points d'une même col, expérimentalement c'est mieux entre 2 et 10. Voir dossier rapport


%Affichage de tout les centroids
% plot(x_centroids,y_centroids, 'b+')

%% Affichage des lignes
imshow(I); hold on;
deja_scannes = []; %vecteur contenant tout les indices des points déjà analysés 
for i=(1:length(x_centroids)) %boucle sur toutes les coordonnées X des points détectés
    if not(ismember(i,deja_scannes)) %check pour éviter une redondance
        deja_scannes(end+1) = i; %on ajoute l'indice du point de réference
        col_x = [x_centroids(i)]; %coordonées en X des points de notre
        col_y = [y_centroids(i)]; %coordonées en Y des points de notre ligne
        for j=(1:length(y_centroids))
            if (abs(y_centroids(i)-y_centroids(j)) < precision_ligne) && j~=i %comparaison des coordonnées Y de 2 points, si < à variable alors ils appartiennent à une même ligne
                col_x(end+1) = x_centroids(j);
                col_y(end+1)= y_centroids(j);
                deja_scannes(end+1) = j; %on ajoute l'indice du point comparé
            end
        end
        plot(col_x,col_y,'.', 'MarkerSize',10)
        %waitforbuttonpress
        %pause(0.05)
    end
end
hold off;

%% Affichage des colonnes
figure;
imshow(I); hold on;
deja_scannes = []; %vecteur contenant tout les indices des points déjà analysés 
for j=(1:length(y_centroids)) %boucle sur toutes les coordonnées Y des points détectés
    if not(ismember(j,deja_scannes)) %check pour éviter une redondance
        deja_scannes(end+1) = j; %on ajoute l'indice du point de réference
        col_x = [x_centroids(j)]; %coordonées en X des points de notre colonne
        col_y = [y_centroids(j)]; %coordonées en Y des points de notre colonne
        for i=(1:length(y_centroids))
            if (abs(x_centroids(j)-x_centroids(i)) < precision_col) && i~=j %comparaison des coordonnées X de 2 points, si < à variable alors ils appartiennent à une même colonne
                col_x(end+1) = x_centroids(i);
                col_y(end+1)= y_centroids(i);
                deja_scannes(end+1) = i; %on ajoute l'indice du point comparé
            end
        end
        plot(col_x,col_y,'.', 'MarkerSize',10)
        %waitforbuttonpress
        %pause(0.05)
    end
end
hold off;