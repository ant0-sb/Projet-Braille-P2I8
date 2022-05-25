clc
clear
close all
name_image = "braille_scan";
I = imread("raw_data/"+name_image,'jpg');
% Binarisation de l'image
if ndims(I)==3 % Test si l'image est en RGB
    I = rgb2gray(I); % Conversion en niveaux de gris 
end
SE = strel('disk',12);
I = imbothat(I,SE); % Égalisation de l'éclairage de la photo
I = imbinarize(I,"global"); % Binarization avec la méthode d'Otsu
% Nettoyage de l'image
I = bwareaopen(I,6); % Suppresion des petits points de lumières
SE = strel('disk',1,0);
I = imdilate(I,SE); % Grossissement des points
I = imresize(I,2); % modification de la résolution (amélioration de la précision)
D = -bwdist(~I,'cityblock'); % tranformée des distances
mask = imextendedmin(D,2); %création d'un masque
D = imimposemin(D,mask);
L = watershed(D); % Application de la méthode de lignes de partage des eaux
L(~I) = 0; % Détection des jointures
I(L == 0) = 0; % Suppression des jointures

% Rotation minime qui permet de corriger des problèmes d'alignement
maxAngleParfait = 0; %nombre maximun de point alignés
angleParfait = 0; % angle de rotation final
for angle=-2.5:0.05:2.5
 Irot = imrotate(I,angle); % On effectue une rotation de l'image
 projectionX = sum(Irot); % On projette l'image sur l'axe Y
 maxProjection = max(projectionX); % On regarde le maxime de point alignés
 if maxProjection >= maxAngleParfait % Si plus de points sont alignés
     maxAngleParfait = maxProjection; % On stocke ce nouveau maximum
     angleParfait = angle; % Cet angle devient notre meilleur angle
 end
end
I = imrotate(I,angleParfait);
