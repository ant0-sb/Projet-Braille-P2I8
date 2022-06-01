function BW1short = traitement_d_image(im0) 
%% Mise en échelle de gris puis binarization de l'image
im1 = rgb2gray(im0);
BW = imbinarize(im1, 0.7);
BW = imcomplement (BW);
%% Filtrage de l'image
BW = imdilate (BW, strel('disk',1));
BW1 = bwpropfilt(BW,'Area', [0 50]);
BW2 = xor(bwareaopen(BW,0),  bwareaopen(BW,50));
BW1short = BW1 (1:1416, 1:915);


