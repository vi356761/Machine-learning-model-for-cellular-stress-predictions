[file, pathname] = uigetfile({'*.jpg';'*.tif'});
imnum=73;
I = imread([pathname,file]);
%J = histeq(I); figure; imshow (J);
%BW = imbinarize(J, 'adaptive', 'Sensitivity', 1.00, 'ForegroundPolarity', 'bright');
BW = imbinarize(I, 'adaptive', 'Sensitivity', 0.6800000, 'ForegroundPolarity', 'bright');
imshow(BW)
filepath = ('D:\vignesh\Modified Code\code\2020-01-10\Scene8\Thresh\');
% fullfile = ([filepath,'phase1.tif']);
% imwrite(J,fullfile);
X2 = imcomplement(BW);
figure;imshow(X2)
X3 = bwareaopen(X2,100);imshow(X3)
X4 = imfill(X3,'holes');imshow(X4)
D = -bwdist(~X4);
imshow(D,[])
Ld = watershed(D);
figure;imshow(label2rgb(Ld))
mask = imextendedmin(D,3);
imshowpair(X4,mask,'blend')
D2 = imimposemin(D,mask);
Ld2 = watershed(D2);
bw3 = X4;
bw3(Ld2 == 0) = 0;
imshow(bw3)
I=bw3;
imshow(I);
hFH = roipoly();
% Create a binary image ("mask") from the ROI object.
%binaryImage = hFH.createMask();
binaryImage = hFH;
figure;imshow(binaryImage);
fullfile = ([filepath,'domain1.tif']);
imwrite(binaryImage,fullfile);
%xy = hFH.getPosition;
blackMaskedImage = I;
blackMaskedImage(~binaryImage) = 0;
figure;imshow(blackMaskedImage);
fullfile = ([filepath,'thresh1.tif']);
imwrite(blackMaskedImage,fullfile)
close all;
for i =2:imnum
    I = imread([pathname,'crop_PC_',num2str(i),'.tif']);
    %fullfile=([filepath,'phase',num2str(i),'.tif']);
    %J = histeq(I);
    %imwrite(J,fullfile);
    %BW = imbinarize(J, 'adaptive', 'Sensitivity', 1.000, 'ForegroundPolarity', 'bright');
    BW = imbinarize(I, 'adaptive', 'Sensitivity', 0.680, 'ForegroundPolarity', 'bright');
    X2 = imcomplement(BW);
    X3 = bwareaopen(X2,100);imshow(X3)
    X4 = imfill(X3,'holes');imshow(X4)
    D = -bwdist(~X4);
    imshow(D,[])
    Ld = watershed(D);  
    imshow(label2rgb(Ld))
    mask = imextendedmin(D,3);
    imshowpair(X4,mask,'blend')
    D2 = imimposemin(D,mask);
    Ld2 = watershed(D2);
    bw3 = X4;
    bw3(Ld2 == 0) = 0;
    imshow(bw3)
    I=bw3;
    imshow(I);
    blackMaskedImage = bwareaopen(I,35);
    blackMaskedImage(~binaryImage) = 0;
    fullfile=([filepath,'thresh',num2str(i),'.tif']);
    imwrite(blackMaskedImage,fullfile)
end
close all;