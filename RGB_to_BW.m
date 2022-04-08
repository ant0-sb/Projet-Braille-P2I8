function RGB_to_BW(path_origin,boolean, path_end)

photo = imread(path_origin);

if boolean 
    BW_image = imbinarize(photo,'adaptive','ForegroundPolarity','dark','Sensitivity',0.55);
else %if the image is pre-treated
    BW_image = imbinarize(photo);
%     BW_image = imfill(BW_image,'holes');
end

switch nargin
    case 2
        imwrite(imcomplement(BW_image),path_origin);
    case 3
        imwrite(imcomplement(BW_image),path_end);
    otherwise
      error('Wrong number of inputs.');
end
end




