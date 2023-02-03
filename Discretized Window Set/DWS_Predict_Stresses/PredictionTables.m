function T = PredictionTables(Z,CC,P1,iteration,DIR)
%C = zeros(60516,1)+2;
%load('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\2ug_mL chalcone 3\NewStresses.mat');
 M_Full =[Z,CC,P1];
 path3 = fullfile([DIR,'\Thresh\Prediction_Table',num2str(iteration),'.xlsx']);
 writetable(array2table(M_Full,'VariableNames',{'Area','Perimeter','Chalcone','Predict'}),path3);
 T = readtable(path3);
end

 