function Z = window(thresh,padding,overlap,blocksize,DIR,iteration)
    sz = size(thresh);
    im = MExpandMatrix(thresh, 1, 1, padding, padding, padding, padding, 0);
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
% Use the below 4 lines of code for crop size 2000*2000
xx = imresize(x,[size(x,1)-1,size(x,2)-1]);
yy = imresize(y,[size(y,1)-1,size(y,2)-1]);
X = mat2vertcol(xx);
Y = mat2vertcol(yy); 
% Use the below two commands for crop size different than 2000*2000
% X = mat2vertcol(x);
% Y = mat2vertcol(y);
Z = [X,Y];
path = fullfile([DIR,'\Thresh\window',num2str(iteration),'.xlsx']);
writetable(array2table(Z,'VariableNames',{'Area','Perimeter'}),path);
%Ta=array2table(Z,'VariableNames',{'Area','Perimeter'});
%Ta = {'Area','Perimeter';X,Y};
%xlswrite(path,Ta);
end