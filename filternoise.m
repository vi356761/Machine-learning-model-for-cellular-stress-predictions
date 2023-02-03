function [Pmax,Pmin,TRMS] = filternoise(P1,P2,RMS_Trac,iteration,DIR)
   TRMS =RMS_Trac; 
   %RMS_Filtered = find(RMS_Trac>600);
   RMS_Filtered = find(RMS_Trac<-600 | RMS_Trac>600);
   TRMS(RMS_Filtered) = 0;
   Pmax = P1; 
   Pmax_Filtered =find(P1<-1000 | P1>1000);
   Pmax( Pmax_Filtered)=0;
   Pmin = P2;
   Pmin_Filtered =find(P2<-1000 | P2>1000);
   Pmin( Pmin_Filtered)=0;
   D = [DIR,'\Predictions'];
   savefile1 = fullfile([D,'\Stresses\Final_Pmax_',num2str(iteration),'.xlsx']);        
   savefile2 = fullfile([D,'\Stresses\Final_Pmin',num2str(iteration),'.xlsx']);
   savefile3 = fullfile([D,'\Tractions\Final_RMS',num2str(iteration),'.xlsx']);
   xlswrite(savefile1,Pmax);
   xlswrite(savefile2,Pmin);
   xlswrite(savefile3,TRMS);   
end
