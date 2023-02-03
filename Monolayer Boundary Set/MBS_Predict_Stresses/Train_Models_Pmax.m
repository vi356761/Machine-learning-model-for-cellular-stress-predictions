cd('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code');
for i = 1:60516
    %load(['D:\vignesh\Data_Analysis\Miku Data\Traction Tables\Pmax\Pmax',num2str(i),'.mat']);
    load(['D:\vignesh\Data_Analysis\Miku Data\to give vignesh\Window Method Tables\Pmax\Pmax',num2str(i),'.mat']);
    %load(['C:\Users\VIGNESH ARAVIND\Desktop\Data_Analysis\Tables\Pmin\Pmin',num2str(i),'.mat']);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmx_Fine(ii);
    [trainedModel, ValidationRMSE1] = trainRegressionModel_Pmax_Step(ii);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmax_GaussSVM(ii); 
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmax_Boost(ii);
    %[trainedModel, ValidationRMSE1] = trainRegression_GPR_Pmax(ii);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmax_QSVM(ii);
    %[trainedModel2, ValidationRMSE2] = trainregression2(['../Pmax',num2str(i),'.mat']);
    %T2 = readtable('C:\Users\VIGNESH ARAVIND\Desktop\Data_Analysis\Miku Data\to give vignesh\no treatment 1\Pmin_Predict.xlsx');
    %T =T1;
    fname = (['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses_New\Step\Pmax\Trained_Model',num2str(i),'.mat']);
    save (fname,'trainedModel');
end
