clc;

load treated_data/bw_braille_scan.jpg
Im1 = imread('echantillon.jpg','jpeg');

BW = im2bw (Im1,0.4);
imshow(BW, []);
[label, n] = bwlabel(Im1);

%BW=Im1>1000;
%{
rp=regionprops(Im1,"Area");
disp('Centroiding is done.');
figure(1); image(Im1); axis image; hold on;
n=numel(rp);
%for i=1:n
%        plot(rp(i).Area(1), rp(i).Area(2), 'r*')
%end
%}

%function label
