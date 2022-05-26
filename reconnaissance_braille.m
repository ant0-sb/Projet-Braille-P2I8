%Objectif: Trouver les coordonnées des points puis créer la matrice générale correspondante
clc
clear
close all

%% Détection des centroids
I = imread("treated_data\bw_braillePierre.tif");
st = regionprops(I, 'Centroid'); %structure = matrice de classe
c = vertcat(st.Centroid); %transforme la structure pour extraire une matrice de double exploitable
x_centroids = c(:,1); %Coordonnées X des points détectés
y_centroids = c(:,2); %Coordonnées Y des points détectés
precision_ligne = 4; %Nombre de pixel max entre 2 points d'une même ligne
precision_col = 5; %Nombre de pixel max entre 2 points d'une même col

%% Affichage des centroids
%figure; imshow(imread("raw_data\braillePierre.jpg")); hold on; plot(x_centroids,y_centroids, 'b+'); hold off

%% Affichage & stockage des lignes
deja_scannes = []; %vecteur contenant tout les indices des points déjà analysés 
matrice_lignes = cell(1,2); %initialisation, on stockera les lignes dans la 1ère colonne et les valeurs moyennes de chaque ligne dans la 2ème colonne
indice_ligne = 0; %indice utile lors du remplissage de matrice_lignes
milieu_feuille_horizontal = size(I,2)/2; %valeur en pixel de la moitié horizontal de la feuille

for ecart=100:50:milieu_feuille_horizontal
    %Partie 1: Détection des lignes les plus sûres en prenant une précision assez stricte
    for i=(1:length(x_centroids)) %boucle sur toutes les coordonnées X des points détectés
        if not(ismember(i,deja_scannes)) && (milieu_feuille_horizontal-ecart<x_centroids(i) && x_centroids(i)<milieu_feuille_horizontal+ecart) %check pour éviter une redondance et on prends une référence dont la coordonée X est au mileu de la feuille pour augmenter la précision si jamais l'image n'est pas parfaitement rotationée
            deja_scannes(end+1) = i; %on ajoute l'indice du point de réference, pour qu'il ne soit plus analysé
            ligne_x = [x_centroids(i)]; %coordonées en X des points de notre ligne
            ligne_y = [y_centroids(i)]; %coordonées en Y des points de notre ligne
            for j=(1:length(y_centroids))
                if (abs(y_centroids(i)-y_centroids(j)) < precision_ligne) && not(ismember(j,deja_scannes)) %comparaison des coordonnées Y de 2 points, si < à précision alors ils appartiennent à une même ligne
                    ligne_x(end+1) = x_centroids(j);
                    ligne_y(end+1)= y_centroids(j);
                    deja_scannes(end+1) = j; %on ajoute l'indice du point comparé, pour qu'il ne soit plus analysé
                end
            end
            ligne_tot = cell(1,length(ligne_x)); %initialisation de ligne_tot qui contiendra tout les points d'1 seule ligne
            for k = (1:length(ligne_x))
                ligne_tot{k} = [ligne_x(k) ligne_y(k)]; %ajout des points appartenant à une même ligne
            end
            indice_ligne=indice_ligne+1;
            matrice_lignes{indice_ligne,1}= ligne_tot;
            matrice_lignes{indice_ligne,2}= mean(ligne_y);
        end
    end
    %Partie 2: Ajout des points appartenant à une ligne mais pas détecté précédemment car trop loin pour rentrer dans les conditions strictes de départ
    for precision=0.2:0.5:5+ecart/300
        for i=(1:length(x_centroids))
            if not(ismember(i,deja_scannes))

                for m=(1:length(matrice_lignes))
                    if (abs(y_centroids(i)-matrice_lignes{m,2}) < precision) && not(ismember(i,deja_scannes))%comparaison par rapport à la valeur moyenne d'une ligne
                        imshow(I);
                        A = vertcat(matrice_lignes{m,1}{:});
                        plot(A(:,1),A(:,2),'-','LineWidth',3)
                        plot(x_centroids(i),y_centroids(i),'r.','MarkerSize',10)

                        matrice_lignes{m,1}(end+1) = {[x_centroids(i) y_centroids(i)]};
                        
            
                         A = vertcat(matrice_lignes{m,1}{:});
                         plot(A(:,1),A(:,2),'-','LineWidth',3)
     
              
                        A = vertcat(matrice_lignes{m,1}{:});
                        matrice_lignes{m,2}=mean(A(:,2));
                        deja_scannes(end+1) = i;               
                    end
                end
            end
        end
    end
end
imshow(I); hold on;
for i=(1:length(matrice_lignes))
     A = vertcat(matrice_lignes{i}{:});
     plot(A(:,1),A(:,2),'-','LineWidth',3)
end

%% Affichage & stockage des colonnes
deja_scannes = []; %vecteur contenant tout les indices des points déjà analysés 
matrice_colonnes = cell(1,3); %initialisation, on stockera les colonnes dans la 1ère colonne, les valeurs moyennes de chaque colonne dans la 2e et les médianes dans la 3e
indice_col = 0; %indice utile lors du remplissage de matrice_colonnes
milieu_feuille_vertical = size(I,1)/2; %valeur en pixel de la moitié horizontale de la feuille

for ecart=100:20:milieu_feuille_vertical
    %Partie 1: Détection des colonnes les plus sûres en prenant une précision assez stricte
    for i=(1:length(y_centroids)) %boucle sur toutes les coordonnées Y des points détectés
        if not(ismember(i,deja_scannes)) && (milieu_feuille_vertical-ecart<y_centroids(i) && y_centroids(i)<milieu_feuille_vertical+ecart) %check pour éviter une redondance et on prends une référence dont la coordonée X est au mileu de la feuille pour augmenter la précision si jamais l'image n'est pas parfaitement rotationée
            deja_scannes(end+1) = i; %on ajoute l'indice du point de réference, pour qu'il ne soit plus analysé
            col_x = [x_centroids(i)]; %coordonées en X des points de notre colonne
            col_y = [y_centroids(i)]; %coordonées en Y des points de notre colonne
            for j=(1:length(x_centroids))
                if (abs(x_centroids(i)-x_centroids(j)) < precision_col) && not(ismember(j,deja_scannes)) %comparaison des coordonnées Y de 2 points, si < à précision alors ils appartiennent à une même colonne
                    col_x(end+1) = x_centroids(j);
                    col_y(end+1)= y_centroids(j);
                    deja_scannes(end+1) = j; %on ajoute l'indice du point comparé, pour qu'il ne soit plus analysé
                end
            end
            col_tot = cell(1,length(col_x)); %initialisation de col_tot qui contiendra tout les points d'1 seule colonne
            for k = (1:length(col_x))
                col_tot{k} = [col_x(k) col_y(k)]; %ajout des points appartenant à une même colonne
            end
            indice_col=indice_col+1;
            matrice_colonnes{indice_col,1}= col_tot;
            matrice_colonnes{indice_col,2}= mean(col_x);
            matrice_colonnes{indice_col,3}= median(col_x);

        end
    end
    %Partie 2: Ajout des points appartenant à une colonne mais pas détecté précédemment car trop loin pour rentrer dans les conditions strictes de départ
    for precision=0.2:0.2:4+ecart/400
        for i=(1:length(y_centroids))
            if not(ismember(i,deja_scannes))
                for m=(1:length(matrice_colonnes))
                    if (abs(x_centroids(i)-matrice_colonnes{m,2}) < precision) %comparaison par rapport à la valeur moyenne d'une colonne
                        matrice_colonnes{m}(end+1) = {[x_centroids(i) y_centroids(i)]};
                        A = vertcat(matrice_colonnes{m}{:});
                        matrice_colonnes{m,2}=mean(A(:,1));
                        matrice_colonnes{m,3}=median(A(:,1));                            
                        deja_scannes(end+1) = i;              
                    end
                end
            end
        end
    end
end
figure; imshow(I); hold on;
for i=(1:length(matrice_colonnes))
     A = vertcat(matrice_colonnes{i}{:});
     plot(A(:,1),A(:,2),'-','LineWidth',3)
end
hold off
%% Matrice finale
matrice_lignes = sortrows(matrice_lignes,2);
matrice_colonnes = sortrows(matrice_colonnes,2);
liste_medianes = vertcat(matrice_colonnes{:,3});
matrice_tot=zeros(length(matrice_lignes),length(matrice_colonnes));
for i=1 : length(matrice_lignes)
    for j=1 : length (matrice_lignes{i}) %tous les points de la ligne i
       difference = abs(liste_medianes - matrice_lignes{i}{j}(1));
       [M,I] = min(difference);
       matrice_tot(i,I) = 1;
    end
end