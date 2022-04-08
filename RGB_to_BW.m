function RGB_to_BW(name_origin)
path_origin = "raw_data/"+name_origin;
path_end = "treated_data/bw_"+name_origin;

photo = imread(path_origin);
BW_image = imbinarize(photo,'adaptive','ForegroundPolarity','dark','Sensitivity',0.55);
%BW_image = bwpropfilt(BW_image,'Area',10,'smallest');
imwrite(imcomplement(BW_image),path_end);
end





