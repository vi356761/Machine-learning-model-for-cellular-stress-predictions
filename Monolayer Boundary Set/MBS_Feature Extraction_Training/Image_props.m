for i =1:3
im = imread(['C:\Users\VIGNESH ARAVIND\Desktop\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone ',num2str(i),'\phase_resized.jpg']); 
im = im2double(im);
im2=min2(im);
im = im - min2(im);
im = im ./ max(max(im)).*255;
im = uint8(im);
BW0 = imbinarize(im, 'adaptive', 'Sensitivity', 0.500000, 'ForegroundPolarity', 'bright');
BW1 = bwareaopen(BW0, 100);
se = strel('line',25,90);se2 = strel('line',25,0);
BW2 = imdilate(BW1,[se,se2]);imshow(BW2);
BW3 = imfill(BW2,'holes');imshow(BW3);
%BW4 = imclearborder(BW3,4);
BW4 = bwareaopen(BW3, 400000);imshow(BW4)
imwrite(BW4, ['C:\Users\VIGNESH ARAVIND\Desktop\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone ',num2str(i),'/', 'domain','.tiff']);
end
for i =1:3
 b = imread(['C:\Users\VIGNESH ARAVIND\Desktop\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone ',num2str(i),'\domain','.tiff']);
 %stat = regionprops(b,'MajorAxisLength','MinorAxisLength','Eccentricity','Circularity','EquivDiameter');
 stat = regionprops(b,'Area','Perimeter');
 writetable(struct2table(stat),['C:\Users\VIGNESH ARAVIND\Desktop\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone ',num2str(i),'\stat',num2str(i),'.xlsx']);
 close all
end

