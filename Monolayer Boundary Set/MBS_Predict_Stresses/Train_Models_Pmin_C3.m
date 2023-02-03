cd('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code');

for i = 1:60516
    load(['D:\vignesh\Data_Analysis\Tables\Table_73_Cell_Arrays\Pmin\Pmin',num2str(i),'.mat']);
    test = ii(:,4);
    count=0;
  for j = 1: 292
        if (test.Pmin(j,1)<0)
            count = count+1;
        end
   end

  if (count>73)
      [trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_Fine(ii);
      fname = (['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmin\Trained_Model',num2str(i),'.mat']);
      save (fname,'trainedModel');
  else
      [trainedModel, ValidationRMSE1] = trainRegressionModel_Pmin_GPR(ii);
      fname = (['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined3\Pmin\Trained_Model',num2str(i),'.mat']);
      save (fname,'trainedModel');
      
  end
 
end
