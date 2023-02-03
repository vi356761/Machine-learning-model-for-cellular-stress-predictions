%[file, pathname] = uigetfile('*.tif');
%i = imread([pathname,file]);
padding = 32;
overlap = 0.75;
blocksize = 32;
for di = 1:73 
    i = imread(['D:\vignesh\Modified Code\code\2020-01-10\Scene8\Thresh\thresh',num2str(di),'.tif']);  
    sz = size(i);
    im = xExpandMatrix(i, 1, 1, padding, padding, padding, padding, 0);
    pad = 31;
    x = zeros((sz(1)/blocksize-1)*(1/(1-overlap))+1); % position in x
    y = zeros((sz(1)/blocksize-1)*(1/(1-overlap))+1);
    inc = round(blocksize*(1-overlap));
for ki = 1:inc:sz(1)-blocksize+1
    for kj = 1:inc:sz(1)-blocksize+1
        im11 = im(ki : ki+blocksize+2*padding-1 , kj : kj+blocksize+2*padding-1);
        im11 = im11(padding+1 : padding+blocksize , padding+1 : padding+blocksize);
        %d = imcrop(i,[ki kj pad pad]);     
        %ki=xmin column;kj=ymin row; pad1=width;pad2=height
        % ki is column, kj is row in crop and...
        %...images.roi.Rectangle(gca,'Position',[1969,1,31,31],'StripeColor','r') command
        %b = imread('D:\vignesh\Data_Analysis\Image Segmentation\BW1.jpg'); imshow(b); hold on; 
        %plot(1, 100, 'r.', 'LineWidth', 2, 'MarkerSize', 25);
        %a=[1,32];d=[32,32];c=[32,1];i=[1,1]
        %b = imread('D:\vignesh\Data_Analysis\Image Segmentation\BW1.jpg'); imshow(b); hold on; 
        %plot(a,d,d,c,c,i,i,a, 'r', 'LineWidth', 2, 'MarkerSize', 25);
        j = bwperim(im11);
        %x((kj+7)/8,(ki+7)/8) = bwarea(im11);
        %y((kj+7)/8,(ki+7)/8) = bwarea(j);
        x((ki+inc-1)/inc, (kj+inc-1)/inc ) = bwarea(im11);
        y((ki+inc-1)/inc, (kj+inc-1)/inc ) = bwarea(j);  
    end
end
xx = imresize(x,[size(x,1)-1,size(x,2)-1]);
yy = imresize(y,[size(y,1)-1,size(y,2)-1]);
X = mat2vertcol(xx);
Y = mat2vertcol(yy); 
Z = [X,Y];
path = fullfile(['D:\vignesh\Modified Code\code\2020-01-10\Scene8\Thresh\Window_Area_New_',num2str(di),'.xlsx']);
writetable(array2table(Z,'VariableNames',{'Area','Perimeter'}),path);
%Ta=array2table(Z,'VariableNames',{'Area','Perimeter'});
%Ta = {'Area','Perimeter';X,Y};
%xlswrite(path,Ta);
end