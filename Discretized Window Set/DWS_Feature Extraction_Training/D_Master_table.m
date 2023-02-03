
for ii=1:73
%  Data1 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\1)0.2ug\Resized\Thresh\Stress Predictions\Stresses',num2str(ii),'.xlsx']);  
%  stresses{1,ii}= Data1;
  Data1 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\1)0.2ug\Resized\Thresh\Traction Predictions\Tractions',num2str(ii),'.xlsx']);  
  tractions{1,ii}= Data1;
end
for ll = 1:73
        mm = 73+ll;
%         Data2 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\2)0.2ug\Resized\Thresh\Stress Predictions\Stresses',num2str(ll),'.xlsx']);
%         stresses{1,mm}= Data2;
        Data2 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\2)0.2ug\Resized\Thresh\Traction Predictions\Tractions',num2str(ll),'.xlsx']);
        tractions{1,mm}= Data2;
end
for nn = 1:73
        oo = 146+nn;
%         Data3 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\1)2ug\Resized\Thresh\Stress Predictions\Stresses',num2str(nn),'.xlsx']);
%         stresses{1,oo}= Data3;
         Data3 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\1)2ug\Resized\Thresh\Traction Predictions\Tractions',num2str(nn),'.xlsx']);
         tractions{1,oo}= Data3;
end
for uu = 1:73
        vv = 219+uu;
%         Data4 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\2)2ug\Resized\Thresh\Stress Predictions\Stresses',num2str(uu),'.xlsx']);
%         stresses{1,vv}= Data4;
        Data4 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\Phase Images\2)2ug\Resized\Thresh\Traction Predictions\Tractions',num2str(uu),'.xlsx']);
        tractions{1,vv}= Data4;
end

%save ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\MasterStresses.mat','stresses');
save ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\MasterTractions.mat','tractions');
