%Pmax, Pmin Train, predict and copy to an excel file
%yfit_Pmax = zeros(60516,1);
%yfit_Pmin = zeros(60516,1);
%yfit_Pmax(1:600,1)=0;
%cd('D:\vignesh\Data_Analysis\Tables');
%Change in 5 places: path,load and savefile 6 places for chalcone change
%path =('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\Predicted 1\Chalcone\High\Fine\');
T1 = readtable('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\3\Trac_X_Predict_Medium.xlsx');
yfit_Pmax = zeros(60516,1);
finetree = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Trac_X\');
step = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Step_Regression\Trac_X\');
fgqsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Trac_X\');
qsvm = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\QSVM\Trac_X\');
savefile = fullfile(['D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\Predicted 3\Chalcone\Medium\Step\','yfit_TracX_SM.xlsx']);
for i = 1:60516
      load([step,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmax(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmax);