clear all;
close all;
clc;

I = imread("braillePierre.jpg");
I_traitee = traitement_d_image(I);
matrice_tot = reconnaissance_braille(I_traitee);
texte = traduction(matrice_tot);
%% Le texte traduit peut être récupéré et lu dans la variable texte.