%Pmax, Pmin Train, predict and copy to an excel file
%yfit_Pmax = zeros(60516,1);
%yfit_Pmin = zeros(60516,1);
%yfit_Pmax(1:600,1)=0;
%cd('D:\vignesh\Data_Analysis\Tables');
%Change in 5 places: T1,load and savefile
T1 = readtable('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\3\Trac_Y_Predict_Medium.xlsx');
yfit_Pmin = zeros(60516,1);
finetree_2 = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Fine_Tree\Trac_Y\');
step_2 = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Step_Regression\Trac_Y\');
fgqsvm_2 = ('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\Gauss_SVM\Trac_Y\');
qsvm_2 =('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Tractions\Control\QSVM\Trac_Y\');
savefile = fullfile(['D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\Predicted 3\Chalcone\Medium\Step\','yfit_TracY_SM.xlsx']);
for i = 1:60516
      load([step_2,'Trained_Model',num2str(i),'.mat']);
      yfit_Pmin(i,1) = trainedModel.predictFcn(T1);
end
xlswrite(savefile,yfit_Pmin);