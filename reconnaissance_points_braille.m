function matrice_tot = reconnaissance_points_braille(I)

%Objectif: Trouver les coordonnées des points puis créer la matrice générale correspondante

%% Détection des centroids

st = regionprops(I, 'Centroid'); %structure = matrice de classes
c = vertcat(st.Centroid); %transforme la structure pour extraire une matrice de double exploitable
x_centroids = c(:,1); %Coordonnées X des points détectés
y_centroids = c(:,2); %Coordonnées Y des points détectés
precision_ligne = 4; %Nombre de pixels max entre 2 points d'une même ligne
precision_col = 5; %Nombre de pixels max entre 2 points d'une même colonne

%% Affichage & stockage des lignes

deja_scannes = []; %vecteur contenant tout les indices des points déjà analysés 
matrice_lignes = cell(1,2); %initialisation, on stockera les lignes dans la 1ère colonne et les valeurs moyennes en y de chaque ligne dans la 2ème colonne
indice_ligne = 0; %indice utile lors du remplissage de matrice_lignes
milieu_feuille_horizontal = size(I,2)/2; %valeur en pixels du milieu horizontal de la feuille

for ecart=100:50:milieu_feuille_horizontal+50 
    %le +50 permet de scanner toute la feuille sinon ecart n'atteindra pas sa borne supérieure car milieu_feuille_horizontal n'est pas forcement un multiple de 50
    %Partie 1: Détection des lignes les plus sûres en prenant une précision assez stricte
    for i=(1:length(x_centroids)) %boucle sur toutes les coordonnées X des points détectés
        if not(ismember(i,deja_scannes)) && (milieu_feuille_horizontal-ecart<x_centroids(i) && x_centroids(i)<milieu_feuille_horizontal+ecart) %check pour éviter une redondance et on prend une référence dont la coordonnée X est au milieu de la feuille pour augmenter la précision si jamais l'image n'est pas parfaitement tournée
            ligne_x = [x_centroids(i)]; %coordonnées en X des points de notre ligne
            ligne_y = [y_centroids(i)]; %coordonnées en Y des points de notre ligne
            indices_valides = find(abs(y_centroids(i)-y_centroids)<precision_ligne); %recherche des points alignés horizontalement avec la référence selon le critère précision_ligne
            indices_valides(ismember(indices_valides,deja_scannes))=[]; %conservation des points pas encore ajoutés à une ligne
            ligne_x = [ligne_x x_centroids(indices_valides)']; %ajout des points valides
            ligne_y = [ligne_y y_centroids(indices_valides)'];
            deja_scannes = [deja_scannes indices_valides']; %ajout des points déjà scannés
            ligne_tot = num2cell([ligne_x ; ligne_y]',2); %creation d'une ligne
            indice_ligne=indice_ligne+1; %permet d'ajouter une nouvelle ligne à la fin 
            matrice_lignes{indice_ligne,1}= ligne_tot; %ajout à matrice_ligne
            matrice_lignes{indice_ligne,2}= mean(ligne_y); %calcul de la moyenne en Y de la ligne
        end
    end
    x_centroids(deja_scannes) = []; %suppression des points déjà scannés
    y_centroids(deja_scannes) = [];
    deja_scannes = []; %réinitialisation de la liste car les points scannés ont été supprimés 
    %Partie 2: Ajout des points appartenant à une ligne mais pas détectés précédemment car trop loin pour rentrer dans les conditions strictes de départ
    for precision=0.2:0.5:4+ecart/100
        for i=(1:length(x_centroids)) %boucle sur les points 
            if not(ismember(i,deja_scannes))
                [~,indice_ligne_plus_proche] = min(abs(y_centroids(i)-[matrice_lignes{:,2}])); %récupération de l'indice de la ligne la plus proche du point
                if (abs(y_centroids(i)-[matrice_lignes{indice_ligne_plus_proche,2}])< precision)
                    matrice_lignes{indice_ligne_plus_proche,1}(end+1) = {[x_centroids(i) y_centroids(i)]}; %ajout du point à la ligne
                    A = vertcat(matrice_lignes{indice_ligne_plus_proche,1}{:});
                    matrice_lignes{indice_ligne_plus_proche,2}=mean(A(:,2));%calcul de la nouvelle moyenne en X de la colonne
                    deja_scannes(end+1) = i;  
                end
            end
        end
        x_centroids(deja_scannes) = []; %Suppression des points déjà scannés
        y_centroids(deja_scannes) = [];
        deja_scannes = []; %réinitialisation de la liste
    end
    
end
for i=(1:length(matrice_lignes))
     A = vertcat(matrice_lignes{i}{:});
     plot(A(:,1),A(:,2),'-','LineWidth',3)
end

%% Affichage & stockage des colonnes
deja_scannes = []; %vecteur contenant tous les indices des points déjà analysés 
matrice_colonnes = cell(1,3); %initialisation, on stockera les colonnes dans la 1ère colonne, les valeurs moyennes de chaque colonne dans la 2e et les médianes dans la 3e
indice_col = 0; %indice utile lors du remplissage de matrice_colonnes
milieu_feuille_vertical = size(I,1)/2; %valeur en pixels du milieu horizontal de la feuille
x_centroids = c(:,1); %Coordonnées X des points détectés
y_centroids = c(:,2); %Coordonnées Y des points détectés

for ecart=100:20:milieu_feuille_vertical+20
    %le +20 permet de scanner toute la feuille sinon ecart n'atteindra pas sa borne supérieure car milieu_feuille_vertical n'est pas forcement un multiple de 20
    %Partie 1: Détection des colonnes les plus sûres en prenant une précision assez stricte
    for i=(1:length(y_centroids)) %boucle sur toutes les coordonnées Y des points détectés
        if not(ismember(i,deja_scannes)) && (milieu_feuille_vertical-ecart<y_centroids(i) && y_centroids(i)<milieu_feuille_vertical+ecart) %check pour éviter une redondance et on prends une référence dont la coordonée X est au mileu de la feuille pour augmenter la précision si jamais l'image n'est pas parfaitement rotationée
            col_x = [x_centroids(i)]; %coordonnées en X des points de notre ligne
            col_y = [y_centroids(i)]; %coordonnées en Y des points de notre ligne
            indices_valides = find(abs(x_centroids(i)-x_centroids)<precision_col); %recherche des points alignés verticalement avec la référence selon le critère précision_colonne
            indices_valides(ismember(indices_valides,deja_scannes))=[]; %conservation des points pas encore ajoutés à une colonne
            col_x = [col_x x_centroids(indices_valides)']; %ajout des points valides
            col_y = [col_y y_centroids(indices_valides)'];
            deja_scannes = [deja_scannes indices_valides']; %ajout des points déjà scannés
            col_tot = num2cell([col_x ; col_y]',2);  %creation d'une colonne
            indice_col=indice_col+1; %permet d'ajouter une nouvelle colonne à la fin 
            matrice_colonnes{indice_col,1}= col_tot; %ajout à matrice_colonne
            matrice_colonnes{indice_col,2}= mean(col_x); %calcul de la moyenne en X de la colonne
            matrice_colonnes{indice_col,3}= median(col_x); %calcul de la médianne en X de la colonne

        end
    end
    x_centroids(deja_scannes) = []; %Suppression des points déjà scannés
    y_centroids(deja_scannes) = [];
    deja_scannes = []; %réinitialisation de la liste
    %Partie 2: Ajout des points appartenant à une colonne mais pas détectés précédemment car trop loin pour rentrer dans les conditions strictes de départ
    for precision=0.2:0.2:4+ecart/400
        for i=(1:length(y_centroids)) %boucle sur les points
            if not(ismember(i,deja_scannes))
                [~,indice_colonne_plus_proche] = min(abs(x_centroids(i)-[matrice_colonnes{:,2}])); %récupération de l'indice de la colonne la plus proche du point
                if (abs(x_centroids(i)-[matrice_colonnes{indice_colonne_plus_proche,2}])< precision)
                    matrice_colonnes{indice_colonne_plus_proche,1}(end+1) = {[x_centroids(i) y_centroids(i)]}; %ajout du point à la colonne
                    A = vertcat(matrice_colonnes{indice_colonne_plus_proche,1}{:});
                    matrice_colonnes{indice_colonne_plus_proche,2}=mean(A(:,1)); %calcul de la nouvelle moyenne en X de la colonne
                    deja_scannes(end+1) = i;  
                end
            end
        end
        x_centroids(deja_scannes) = []; %Suppression des points déjà scannés
        y_centroids(deja_scannes) = [];
        deja_scannes = []; %réinitialisation de la liste
    end
end

for i=(1:length(matrice_colonnes))
     A = vertcat(matrice_colonnes{i}{:});
     plot(A(:,1),A(:,2),'-','LineWidth',3)
end

%% Matrice finale

matrice_lignes = sortrows(matrice_lignes,2);
matrice_colonnes = sortrows(matrice_colonnes,2);
liste_medianes = vertcat(matrice_colonnes{:,3});
%boucle if
liste_sauts_medianes = zeros(length(liste_medianes)-1,1);
for i=2:length(liste_medianes)
    liste_sauts_medianes(i-1)=liste_medianes(i)-liste_medianes(i-1);
end
saut_median = median(liste_sauts_medianes);
for i=1:length(liste_sauts_medianes)
    if liste_sauts_medianes(i)>1.5*saut_median
        liste_medianes = vertcat(liste_medianes(1:i),(liste_medianes(i+1)+liste_medianes(i))/2,liste_medianes(i+1:end));
    end
end

matrice_tot=zeros(length(matrice_lignes),length(matrice_colonnes));
for i=1 : length(matrice_lignes)
    for j=1 : length (matrice_lignes{i}) %tous les points de la ligne i
       difference = abs(liste_medianes - matrice_lignes{i}{j}(1));
       [~,I] = min(difference); %on récupère l'index du min correspondant à la colonne à laquelle appartient le point
       matrice_tot(i,I) = 1;
    end
end