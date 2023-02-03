function [yfit_Pmax,yfit_Pmin,yfit_RMS] = Predict(T,STEP1,STEP2,STEP3,R,iteration,DIR)
cd(DIR);
        if exist('Predictions') ~= 7
            mkdir('Predictions');
        end
D = [DIR,'\Predictions'];
cd(D);
        if exist('Stresses') ~= 7
            mkdir('Stresses');
        end
        if exist('Tractions') ~= 7
            mkdir('Tractions');
        end
yfit_Pmax = zeros(R,1);
yfit_Pmin = zeros(R,1);
yfit_RMS = zeros(R,1);
savefile1 = fullfile([D,'\Stresses\yfit_Pmax',num2str(iteration),'.xlsx']);        
savefile2 = fullfile([D,'\Stresses\yfit_Pmin',num2str(iteration),'.xlsx']);
savefile3 = fullfile([D,'\Tractions\yfit_RMS',num2str(iteration),'.xlsx']);
parfor i1 = 1:R
      T1 = T(i1,1:4);
      X = load([STEP1,'Trained_Model',num2str(i1),'.mat']);
      Y = load([STEP2,'Trained_Model',num2str(i1),'.mat']);
      Z = load([STEP3,'Trained_Model',num2str(i1),'.mat']);
      yfit_Pmax(i1,1) = X.trainedModel.predictFcn(T1);
      yfit_Pmin(i1,1) = Y.trainedModel1.predictFcn(T1);
      %yfit_RMS(i1,1) = Z.trainedModel.predictFcn(T1); %Only for QSVM
      yfit_RMS(i1,1) = Z.ii.predictFcn(T1); %For LSVM,SR
end
xlswrite(savefile1,yfit_Pmax);
xlswrite(savefile2,yfit_Pmin);
xlswrite(savefile3,yfit_RMS);
end