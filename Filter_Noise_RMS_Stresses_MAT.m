%for j = 1:8
%[file,path]= uigetfile('*.dat','Select the domain file');
%Domain = readmatrix([path,file],'Range','D1:D60516');
%Dom = readmatrix('D:\vignesh\Data_Analysis\Miku Data\tractions_new\control\2\Tractions\Time1\domain.dat');
Dom = readmatrix('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Tractions\Time1\domain.dat');
Domain = Dom(:,4);
% Pmax = readmatrix('D:\vignesh\Data_Analysis\Tables\STEP\2\Chalcone\0.2ug\Pmax,Pmin_predicted_tree.xlsx','Range','A1:A60516');
%Pmin = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmin\AVG\STEP AVG\yfit_Pmin_STEP_Control1_High.xlsx');
%Pmax = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmax\AVG\STEP AVG\yfit_Pmax_STEP_Control1_High.xlsx');
%Trac = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Tractions\SR\Control1\yfit_RMS_STEP_High.xlsx');
%Trac = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Tractions\SR\Control2\yfit_RMS_SR.xlsx');
Pmin = readmatrix('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Time_Series_SR\Predictions\Stresses\Final_Pmin_AVG.xlsx');
Pmax = readmatrix('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Time_Series_SR\Predictions\Stresses\Final_Pmax_AVG.xlsx');
Trac = readmatrix('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Time_Series_SR\Predictions\Tractions\Final_RMS_AVG.xlsx');
for i = 1:60516
 
 if Domain(i,1) == 0
     
    Pmax(i,1) = 0;
    Pmin(i,1) = 0;
    Trac(i,1) = 0;
  end

end
   TRMS =Trac; 
   RMS_Filtered = find(Trac<-600 | Trac>600);
   TRMS(RMS_Filtered) = 0;
   P1 = Pmax; 
   Pmax_Filtered =find(Pmax<-1000 | Pmax>1000);
   P1(Pmax_Filtered)=0;
   P2 = Pmin;
   Pmin_Filtered =find(Pmin<-1000 | Pmin>1000);
   P2(Pmin_Filtered)=0;
   
%xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmin\AVG\STEP AVG\yfit_Pmin_STEP_Control1_High_STEP_Fixed.xlsx',P2);
%xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmax\AVG\STEP AVG\yfit_Pmax_STEP_Control1_High_STEP_Fixed.xlsx',P1);
%xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Tractions\SR\Control1\yfit_RMS_STEP_High_Fixed.xlsx',TRMS);
%xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Tractions\SR\Control2\yfit_RMS_SR_Fixed.xlsx',TRMS);
xlswrite('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Time_Series_SR\Predictions\Stresses\Final_Pmin_AVG_Fixed.xlsx',P2);
xlswrite('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Time_Series_SR\Predictions\Stresses\Final_Pmax_AVG_Fixed.xlsx',P1);
xlswrite('D:\vignesh\Modified Code\code\2020-01-10\Scene2\Time_Series_SR\Predictions\Tractions\Final_RMS_AVG_Fixed.xlsx',TRMS);
%end
%%
 clear all;clc