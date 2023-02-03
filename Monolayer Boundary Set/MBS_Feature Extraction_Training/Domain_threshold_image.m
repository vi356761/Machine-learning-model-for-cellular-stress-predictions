[file, pathname] = uigetfile({'*.jpg';'*.tif'});
imnum = 37;
I = imread([pathname,file]);
J = histeq(I); imshow (J);
filepath = ('D:\vignesh\Modified Code\code\Fn+Collagen\Collagen\C6\Thresh\');
%fullfile = ([filepath,'phase1.tif']);
BW = imbinarize(J, 'adaptive', 'Sensitivity', 1.00, 'ForegroundPolarity', 'bright');
%BW = imbinarize(I, 'adaptive', 'Sensitivity', 0.8500000, 'ForegroundPolarity', 'bright');
figure;imshow(BW)
%imwrite(J,fullfile);
X2 = imcomplement(BW);
figure;imshow(X2)
X3 = bwareaopen(X2,30);imshow(X3)
X4 = imfill(X3,'holes');figure;imshow(X4)
%X5= edge(X4,'canny');imshow(X5)
% X6 = bwpropfilt(X4, 'Solidity', [0.25 + eps(0.25), Inf]);
% figure; imshow(X6)
%se = strel('disk',1);
%x6 = imdilate(X4,se); imshow(x6)
%x7 = imfill(x6,'holes');imshow(x7)
%Vignesh 10/9/19
% Code modified by Vignesh. Core of the code gathered from https://stackoverflow.com/
% [file, pathname] = uigetfile('*.tif');
% I = imread([pathname,file]);
I=X4;
%I=x7;
imshow(I);
hFH = roipoly();
% Create a binary image ("mask") from the ROI object.
%binaryImage = hFH.createMask();
binaryImage = hFH;
figure;imshow(binaryImage);
fullfile = ([filepath,'domain1.tif']);
%imwrite(binaryImage,fullfile);
%xy = hFH.getPosition;
blackMaskedImage = I;
blackMaskedImage(~binaryImage) = 0;
figure;imshow(blackMaskedImage);
fullfile = ([filepath,'thresh1.tif']);
%imwrite(blackMaskedImage,fullfile)
close all;
for i =2:imnum
    I = imread([pathname,'crop_PC_',num2str(i),'.tif']);
    fullfile=([filepath,'phase',num2str(i),'.tif']);
    J = histeq(I);
    imwrite(J,fullfile);
    BW = imbinarize(J, 'adaptive', 'Sensitivity', 1.000, 'ForegroundPolarity', 'bright');
    X2 = imcomplement(BW);
    X3 = bwareaopen(X2,75);imshow(X3)
    X4 = imfill(X3,'holes');figure;imshow(X4)
    %X5= edge(X4,'canny');imshow(X5)
    % X6 = bwpropfilt(X4, 'Solidity', [0.25 + eps(0.25), Inf]);
    % figure; imshow(X6)
    se = strel('disk',1);
    %x6 = imdilate(X4,se); imshow(x6)
    %x7 = imfill(x6,'holes');imshow(x7)
%Vignesh 10/9/19
% Code modified by Vignesh. Core of the code gathered from https://stackoverflow.com/
% [file, pathname] = uigetfile('*.tif');
% I = imread([pathname,file]);
    %I=x7;
    I=X4;
    imshow(I);
    blackMaskedImage = I;
    blackMaskedImage(~binaryImage) = 0;
    fullfile=([filepath,'thresh',num2str(i),'.tif']);
    imwrite(blackMaskedImage,fullfile)
end
close all;