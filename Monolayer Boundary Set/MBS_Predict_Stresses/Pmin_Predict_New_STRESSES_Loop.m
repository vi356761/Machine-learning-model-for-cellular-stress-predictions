path =('D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\');
for j = 1:8
T1 = readtable([path,'stat',num2str(j),'_Pmin.xlsx']);
yfit_Pmin = zeros(60516,1);
%finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Pmin\');
step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Step\Pmin\');
%fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Pmin\');
qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\QSVM\Pmin\');
c1= ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmin\');
c3 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmin\');
savefile = fullfile(['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\Pmin\Step','\yfit_Pmin_Step',num2str(j),'.xlsx']);
for i = 1:60516
      load([step,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmin(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmin);
end