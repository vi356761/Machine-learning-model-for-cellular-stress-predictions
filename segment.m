function thresh = segment(Im,DIR,iteration,hFH)    
    J = histeq(Im);
    %imwrite(J,fullfile);
    BW = imbinarize(J, 'adaptive', 'Sensitivity', 1.000, 'ForegroundPolarity', 'bright');
    %BW = imbinarize(I, 'adaptive', 'Sensitivity', 0.680, 'ForegroundPolarity', 'bright');
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
    II=bw3;
    imshow(II);
    thresh = bwareaopen(II,35);
    thresh(~hFH) = 0;
    cd(DIR);
      if exist('Thresh') ~= 7
         mkdir('Thresh');
      end
    fullfile=([DIR,'\Thresh\thresh',num2str(iteration),'.tif']);
    imwrite(thresh,fullfile)
    close all;
end