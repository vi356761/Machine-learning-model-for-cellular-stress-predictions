path =('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Thresh\Predict table\');
T = readtable([path,'Pmin_Stress1.xlsx']);
yfit_Pmin = zeros(60516,1);
%finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Pmin\');
%step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Step\Pmin\');
STEP = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses_New\Step\Pmin\');
%fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Pmin\');
%qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\QSVM\Pmin\');
QSVM = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses_New\QSVM\Pmin\');
c1= ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmin\');
c3 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmin\');
%savefile = fullfile([path,'yfit_Pmin_QSVM.xlsx']);
savefile = fullfile('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Thresh\Predict table\Predicted_Pmax_Pmin\yfit_Pmin_Step1.xlsx');
for i = 1:60516
      T1 = T(i,1:4);
      load([STEP,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmin(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmin);