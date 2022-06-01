function BW1short = traitement_d_image(im0) 
%% mise en échelle de gris puis binarization de l'image
figure;
im1 = rgb2gray(im0);
imshow(im1)
title("Feuille de braille en nuances de gris")
drawnow;
figure; 
BW = imbinarize(im1, 0.7);
BW = imcomplement (BW);
%% filtrage de l'image
BW = imdilate (BW, strel('disk',1));
BW1 = bwpropfilt(BW,'Area', [0 50]);
BW2 = xor(bwareaopen(BW,0),  bwareaopen(BW,50));
imshow(BW2)
title("Feuille de braille binarisée après filtrage")
drawnow;
BW1short = BW1 (1:1416, 1:915);


