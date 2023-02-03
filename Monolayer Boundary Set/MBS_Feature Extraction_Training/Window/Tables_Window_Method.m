%d = readmatrix('.xlsx')
load('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\NewStresses.mat');
for i = 1:37
 Master = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\Window_Area_',num2str(i),'.xlsx']);
 P1 = Stresses{1,i}(:,4);
 P2 = Stresses{1,i}(:,5);
 M_tab1 = [Master,P1];
 %M_tab1 = [Master,P1,d];
 M_tab2 = [Master,P2];
 %M_tab1 = [Master,P2,d];
 M_Full =[Master,P1,P2];
 path1 = fullfile(['D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\Pmax_Stress',num2str(i),'.xlsx']);
 path2 = fullfile(['D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\Pmin_Stress',num2str(i),'.xlsx']);
 path3 = fullfile(['D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\Stresses',num2str(i),'.xlsx']);
 writetable(array2table( M_tab1,'VariableNames',{'Area','Perimeter','Pmax'}),path1);
 writetable(array2table( M_tab2,'VariableNames',{'Area','Perimeter','Pmin'}),path2);
 writetable(array2table(M_Full,'VariableNames',{'Area','Perimeter','Pmax','Pmin'}),path3);
end