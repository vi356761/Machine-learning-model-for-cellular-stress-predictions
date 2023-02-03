
function avg(path,n)
      T = zeros(60516,1);
     for i = 1:n
       fullfile = ([path,'Window_Area_',num2str(i),'.xlsx']);
       M = readmatrix(fullfile);
       T = T+M;
     end
     AVG = T/n;
     %writetable(array2table(AVG,'VariableNames',{'Area','Perimeter','Chalcone','Predict'}),[path,'\AVG_Predict.xlsx']);
     writetable(array2table(AVG,'VariableNames',{'Area','Perimeter'}),[path,'\AVG_Window_Area_AVERAGE.xlsx']);
     %writematrix(AVG,[path,'yfit_Pmin_LSVM_Fixed_AVG.xlsx']);
end
       