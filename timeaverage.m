function [Normal, Shear, RMS] = timeaverage(Pmax,Pmin,TRMS,Normal,Shear,RMS,iteration)
%Pmax = zeros(73,1);
%Pmin = zeros(73,1);
%RMS = zeros(N,1);
    Avg_Normal = (Pmax+Pmin)/2;
    Max_Shear = (Pmax-Pmin)/2;
    RMS (iteration,1) = mean2(TRMS);
    %Pmax(i,1) = mean2(Pmax1);
    %Pmin(i,1) = mean2(Pmin1);
    Normal(iteration,1)= mean2(Avg_Normal) ;
    Shear(iteration,1) = mean2(Max_Shear);
%     X = fprintf('The average Normal Stress in Pa: %4.2f \n',Normal(iteration,1));
%     Y = fprintf('The average Normal Stress in Pa: %4.2f \n',Shear(iteration,1));
%     ZZ = fprintf('The average Normal Stress in Pa: %4.2f \n',RMS(iteration,1));
    formatSpec1 = ('The average Normal Stress in Pa: %4.2f \n');
    formatSpec2 = ('The average Shear Stress in Pa: %4.2f \n');
    formatSpec3 = ('The average RMS Traction in Pa: %4.2f \n');
    fprintf(formatSpec1,Normal(iteration,1));
    fprintf(formatSpec2,Shear(iteration,1));
    fprintf(formatSpec3,RMS(iteration,1));
%     disp(X);
%     disp(Y);
%     disp(ZZ);
end