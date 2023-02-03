C = zeros(60516,1)+1;
%C = zeros(60516,1)+2;
%load('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\2ug_mL chalcone 3\NewStresses.mat');
P1 = NaN(60516,1);
for i = 1:73
 Master = readmatrix(['D:\vignesh\Modified Code\code\2020-01-10\Scene8\Thresh\Window_Area_',num2str(i),'.xlsx']);
 M_Full =[Master,C,P1];
 path3 = fullfile(['D:\vignesh\Modified Code\code\2020-01-10\Scene8\Thresh\Predictions Table\Predict',num2str(i),'.xlsx']);
 writetable(array2table(M_Full,'VariableNames',{'Area','Perimeter','Chalcone','Predict'}),path3);
end