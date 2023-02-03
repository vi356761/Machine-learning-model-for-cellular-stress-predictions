for i = 1: 8

  im = imread(['D:\vignesh\Modified Code\code\2020-01-10\Scene',num2str(i),'\croppeddata\crop_PC_10.tif']); 

  figh=figure; set(figh,'numbertitle', 'off','name','Draw boundary, double click to finish, and press enter')
  [BW, xrub, yrub] = roipoly(im);
  imwrite(BW, ['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\','domain',num2str(i),'.tif']);
  b = imread(['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\','domain',num2str(i),'.tif']);
  %stat = regionprops(b,'MajorAxisLength','MinorAxisLength','Eccentricity','Circularity','EquivDiameter');
  stat = regionprops(b,'Area','Perimeter');
  writetable(struct2table(stat),['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\','stat',num2str(i),'.xlsx']);
  close all

end