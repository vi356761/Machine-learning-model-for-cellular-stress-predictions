%for j = 1:8
%[file,path]= uigetfile('*.dat','Select the domain file');
%Domain = readmatrix([path,file],'Range','D1:D60516');
%Dom = readmatrix('D:\vignesh\Modified Code\code\2020-01-10\Scene1\Tractions\Time1\domain.dat');
Dom = readmatrix('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\2\Tractions\Time1\domain.dat');
Domain = Dom(:,4);
% Pmax = readmatrix('D:\vignesh\Data_Analysis\Tables\QSVM\2\Chalcone\0.2ug\Pmax,Pmin_predicted_tree.xlsx','Range','A1:A60516');
% Pmin = readmatrix('D:\vignesh\Data_Analysis\Tables\QSVM\2\Chalcone\0.2ug\Pmax,Pmin_predicted_tree.xlsx','Range','B1:B60516');
Pmax = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmax\AVG\QSVM AVG\yfit_Pmax_QSVM_Control2.xlsx');
Pmin = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmin\AVG\QSVM AVG\yfit_Pmin_QSVM_Control2.xlsx');
for i = 1:60516
 
 if Domain(i,1) == 0
     
    Pmax(i,1) = 0;
    Pmin(i,1) = 0;

  end

end
a =find(Pmax>999); b =find(Pmax<-999);  
Pmax(a)=0; Pmax(b)=0;
aa =find(Pmin>999); bb =find(Pmin<-999);  
Pmin(aa)=0; Pmin(bb)=0;
xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmax\AVG\QSVM AVG\yfit_Pmax_QSVM_Control2_Fixed_Final.xlsx',Pmax);
xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmin\AVG\QSVM AVG\yfit_Pmin_QSVM_Control2_Fixed_Final.xlsx',Pmin);
%end
%% Get domain image from single domain column matrix:
% i=readmatrix('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\3\Tractions\Time1\domain.dat');
% ii = reshape(i(:,4),[246,246]);
% iii = imresize(ii,[2000,2000]);
% imshow(iii)