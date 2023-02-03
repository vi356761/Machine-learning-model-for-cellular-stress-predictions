
cd('D:\vignesh\Data_Analysis\Tables\Finalized Models and Code');

for i = 1:60516
    load(['D:\vignesh\Data_Analysis\Miku Data\Traction Tables\Pmax\Pmax',num2str(i),'.mat']);
    test = ii(:,4);
    count=0;
  for j = 1: 292
        if (test.Pmax(j,1)==0)
            count = count+1;
        end
   end

  if (count>72 && count<150)
      [trainedModel, ValidationRMSE1] = trainRegressionModel_Pmax_Step(ii);
      fname = (['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmax\Trained_Model',num2str(i),'.mat']);
      save (fname,'trainedModel');

  else
      [trainedModel, ValidationRMSE1] = trainRegressionModel_Pmx_Bag(ii);
      fname = (['D:\vignesh\Data_Analysis\Tables\Finalized Models and Code\Trained Model Base\Stresses\Combined1\Pmax\Trained_Model',num2str(i),'.mat']);
       save (fname,'trainedModel');
  
  end
 
end
