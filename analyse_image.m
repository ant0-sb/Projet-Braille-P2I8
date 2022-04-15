clc;

load treated_data/bw_braille_scan.jpg
Im1 = imread('treated_data/bw_braille_scan.jpg','jpeg');
T = graythresh(Im1)
BW = im2bw (Im1,T);

imshow(BW, []);
CC = bwconncomp(BW);
S = regionprops(CC,'Centroid');

S(2)
%figure;
for i=2 : 3049(S)
    plot(S(i(1)),S(i(2)));
end


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
