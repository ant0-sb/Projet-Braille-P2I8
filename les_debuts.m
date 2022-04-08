clc;
close all;
RGB_to_BW("braille_scan.jpg", false, "résultat.jpg") 
%true seulement pour les vraies photos pas trichées
imshow("résultat.jpg")
