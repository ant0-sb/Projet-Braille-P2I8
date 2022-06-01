clear all;
close all;
clc;
%% Script principal du projet braille P2I8
nom_image = "photo_braille"; %nom de la photo à traduire dans le dossier "raw_data", elle doit être au format jpg

I = imread("raw_data\"+nom_image+".jpg"); %lecture de la photo

I_traitee = traitement_d_image(I); %traitement de la photo

%imwrite(I_traitee,"treated_data\"+nom_image+"_traitee.tif") %sauvegarde du traitement

matrice_binaire = reconnaissance_points_braille(I_traitee); %création de l'équivalent de la photo en matrice de 0 et 1

texte = traduction(matrice_binaire); %traduction de la matrice binaire équivalente
%% Le texte traduit peut être récupéré et lu dans la variable texte.
disp(texte(:,1));