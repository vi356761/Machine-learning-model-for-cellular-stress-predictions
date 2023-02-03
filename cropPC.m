function [Im] = cropPC(Phase,pathname,i1,i2,j1,j2,iteration)

    I = imread([pathname,Phase,num2str(iteration),'.tif']);
    Im = I(i1:i2,j1:j2);
    imwrite(Im,[pathname,'\Crop_PC_',num2str(iteration),'.tif']);
  
end