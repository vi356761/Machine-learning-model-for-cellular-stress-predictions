%Pmax, Pmin Train, predict and copy to an excel file
%yfit_Pmax = zeros(60516,1);
%yfit_Pmin = zeros(60516,1);
%yfit_Pmax(1:600,1)=0;
%cd('D:\vignesh\Data_Analysis\Tables');
%Change in 5 places: T1,load and savefile
path =('D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\');
for j = 1:8
T1 = readtable([path,'stat',num2str(j),'_Pmin.xlsx']);
yfit_Pmin = zeros(60516,1);
finetree_2 = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Trac_Y\');
step_2 = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Step_Regression\Trac_Y\');
fgqsvm_2 = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Trac_Y\');
qsvm_2 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\QSVM\Trac_Y\');
savefile = fullfile(['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\Tractions\Trac_Y\Fine_Gauss_SVM','\yfit_TracY_FGQSVM',num2str(j),'.xlsx']);
for i = 1:60516
      load([fgqsvm_2,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmin(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmin);
end