path =('D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\');
for j = 1:8
T1 = readtable([path,'stat',num2str(j),'_Pmax.xlsx']);
yfit_Pmax = zeros(60516,1);
%finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Pmax\');
step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Step\Pmax\');
%fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Pmax\');
qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\QSVM\Pmax\');
c1= ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmax\');
c3 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmax\');
savefile = fullfile(['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\Pmax\Step','\yfit_Pmax_Step',num2str(j),'.xlsx']);
for i = 1:60516
      load([step,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmax(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmax);
end