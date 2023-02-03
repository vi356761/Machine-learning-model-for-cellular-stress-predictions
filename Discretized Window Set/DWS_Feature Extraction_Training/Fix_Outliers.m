Pmax = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmax\AVG\LSVM AVG\yfit_Pmax_LSVM_Medium_Fixed.xlsx');
Pmin = readmatrix('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmin\AVG\LSVM AVG\yfit_Pmin_LSVM_Medium_Fixed.xlsx');
a =find(Pmax>999); b =find(Pmax<-999);  
Pmax(a)=0; Pmax(b)=0;
aa =find(Pmin>999); bb =find(Pmin<-999);  
Pmin(aa)=0; Pmin(bb)=0;
xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmax\AVG\LSVM AVG\yfit_Pmax_LSVM_Medium_Fixed_Final.xlsx',Pmax);
xlswrite('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Predictions\Stresses\Pmin\AVG\LSVM AVG\yfit_Pmin_LSVM_Medium_Fixed_Final.xlsx',Pmin);