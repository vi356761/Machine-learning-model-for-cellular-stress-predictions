%Pmax, Pmin Train, predict and copy to an excel file
%yfit_Pmax = zeros(60516,1);
%yfit_Pmin = zeros(60516,1);
%yfit_Pmax(1:600,1)=0;
%cd('D:\vignesh\Data_Analysis\Tables');
%Change in 5 places: path,load and savefile 6 places for chalcone change
%path =('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\Predicted 1\Chalcone\High\Fine\');
path =('D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\');
for j = 1:8
T1 = readtable([path,'stat',num2str(j),'_Pmax.xlsx']);
yfit_Pmax = zeros(60516,1);
finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Trac_X\');
step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Step_Regression\Trac_X\');
fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Trac_X\');
qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\QSVM\Trac_X\');
savefile = fullfile(['D:\vignesh\Modified Code\code\2020-01-10\Predict Stresses\Tractions\Trac_X\Fine_Gauss_SVM','\yfit_TracX_FGQSVM',num2str(j),'.xlsx']);
for i = 1:60516
      load([fgqsvm,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmax(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmax);
end