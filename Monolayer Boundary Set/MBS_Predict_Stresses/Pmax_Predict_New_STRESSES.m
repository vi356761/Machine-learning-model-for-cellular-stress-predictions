path =('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Thresh\Predict table\');
T = readtable([path,'Pmax_Stress1.xlsx']);
yfit_Pmax = zeros(60516,1);
%finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Pmax\');
%step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Step\Pmax\');
STEP = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses_New\Step\Pmax\');
%fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Pmax\');
%qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\QSVM\Pmax\');
QSVM = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses_New\QSVM\Pmax\');
c1= ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmax\');
c3 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmax\');
%savefile = fullfile([path,'yfit_Pmax_QSVM.xlsx']);
savefile = fullfile('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Thresh\Predict table\Predicted_Pmax_Pmin\yfit_Pmax_Step1.xlsx');
for i = 1:60516
      T1 = T(i,1:4);
      load([STEP,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmax(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmax);