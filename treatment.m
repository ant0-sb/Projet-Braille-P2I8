close all
clear
clc
name_image = "braillePierre";
im0 = imread("raw_data/"+name_image,'jpg');
if ndims(im0)==3
    im0 = rgb2gray(im0); 
end
BW = imbinarize(im0, 0.7);
BW = imcomplement (BW);
BW = imdilate (BW, strel('disk',1));
BW = bwpropfilt(BW,'Area', [0 50]);
% Equivalent treatment: BW2 = xor(bwareaopen(BW,0),  bwareaopen(BW,50));
BWzoom = BW (50:1500, 80:1000);
imwrite(BWzoom,"treated_data/bw_"+name_image+".jpg");
st = regionprops(BWzoom, 'Centroid');
c = vertcat(st.Centroid);
imshow(BWzoom); hold on;
line(c(:,1), c(:,2), 'LineStyle','none', 'Marker','+', 'Color','b')