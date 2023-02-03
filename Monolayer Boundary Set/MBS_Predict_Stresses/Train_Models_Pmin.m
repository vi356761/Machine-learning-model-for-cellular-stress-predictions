cd('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code');
for i = 1:60516
    %load(['D:\vignesh\Data_Analysis\Miku Data\Traction Tables\Pmin\Pmin',num2str(i),'.mat']);
    load(['D:\vignesh\Data_Analysis\Miku Data\to give vignesh\Window Method Tables\Pmin\Pmin',num2str(i),'.mat']);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_QSVM(ii);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_GaussSVM(ii);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_Fine(ii);
    [trainedModel, ValidationRMSE1] = trainRegressionModel_Step_Pmin(ii);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_GPR(ii);
    %[trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_Boost(ii);
    %[trainedModel2, ValidationRMSE2] = trainregression2(['../Pmax',num2str(i),'.mat']);
    fname = (['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses_New\Step\Pmin\Trained_Model',num2str(i),'.mat']);
    save (fname,'trainedModel');
end
