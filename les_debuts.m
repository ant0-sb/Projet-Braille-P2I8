clc;
close all;
nom = "braille.jpg";
RGB_to_BW(nom) 
imshow("treated_data/bw_"+nom)
