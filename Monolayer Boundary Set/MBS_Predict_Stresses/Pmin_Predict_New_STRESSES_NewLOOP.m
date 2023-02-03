h  = dir('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\3\Chalcone\M1\');
for j = 3:5
folder = h(j).name;
path =(['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\3\Chalcone\M1\',folder,'\']);
readfile = fullfile([path,'Pmin_',folder,'_Predict.xlsx']);
T1 = readtable(readfile);
yfit_Pmin = zeros(60516,1);
%finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Pmin\');
step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Step\Pmin\');
%fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Pmin\');
qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\QSVM\Pmin\');
c1= ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmin\');
c3 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmin\');
savefile = fullfile([path,'yfit_Pmin_Step_',folder,'.xlsx']);
for i = 1:60516
      load([c1,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmin(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmin);
end