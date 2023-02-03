parpool(4);%60516
cd('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Table Functions');
% A = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\0.2u\1\stat1.xlsx');
% B = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\0.2u\2\stat2.xlsx');
% C = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\2\1\stat_1.xlsx');
% D = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\2\3\stat_3.xlsx');
%load('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\MasterStresses.mat');
load('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\MasterTractions.mat');%..........Tractions

parfor z = 1:60516
% a = A;
% b = B;
% c = C;
% d = D;
P = zeros(292, 3);  %P = zeros(333, 3);
E = zeros(292, 5);  %D = zeros(333, 3);
P1 = zeros(292, 1); %P1 = zeros(333, 1);
P2 = zeros(292, 1);
P3 = zeros(292, 1); %Prms........Traction RMS
%S = stresses;
S = tractions;%.....changed for Tractions
 
    for j = 1:73
        %Loop Data to train other data points...from 1 to 60516!
        E(j,:) = S{1,j}(z,:);
        P1 (j,1) = E(j,3);
        P2 (j,1) = E(j,4);
        P3 (j,1) = sqrt([E(j,3)^2]+[E(j,4)^2]);%..........Tractions
        P(j,1:3)= [E(j,1:2),E(j,5)];
    end
    
    for l = 1:73
        m = 73+l;
        E(m,:) = S{1,m}(z,:);
        P1 (m,1) = E(m,3);
        P2 (m,1) = E(m,4);
        P3 (m,1) = sqrt([E(m,3)^2]+[E(m,4)^2]);%..........Tractions
        P(m,1:3)= [E(m,1:2),E(m,5)];
     end

    for n = 1:73
        o = 146+n;
        E(o,:) = S{1,o}(z,:);
        P1 (o,1) = E(o,3);
        P2 (o,1) = E(o,4);
        P3 (o,1) = sqrt([E(o,3)^2]+[E(o,4)^2]);%..........Tractions
        P(o,1:3)= [E(o,1:2),E(o,5)];
        
    end

    for u = 1:73
        v = 219+u;
        E(v,:) = S{1,v}(z,:);
        P1 (v,1) = E(v,3);
        P2 (v,1) = E(v,4);
        P3 (v,1) = sqrt([E(v,3)^2]+[E(v,4)^2]);%..........Tractions
        P(v,1:3)= [E(v,1:2),E(v,5)];  
    end
    Pmax = [P,P1];
    Pmin = [P,P2];
    Prms = [P,P3];%..........Tractions
    %Pmax = array2table(Pmax,'VariableNames',{'Area','Perimeter','Chalcone','Pmax'});
    %Pmin = array2table(Pmin,'VariableNames',{'Area','Perimeter','Chalcone','Pmin'});
    Pmax = array2table(Pmax,'VariableNames',{'Area','Perimeter','Chalcone','TX'});%........Tractions
    Pmin = array2table(Pmin,'VariableNames',{'Area','Perimeter','Chalcone','TY'});%........Tractions
    Prms = array2table(Prms,'VariableNames',{'Area','Perimeter','Chalcone','TRMS'});%........Tractions
    %cd('D:\vignesh\Table Generating Codes');
    %parsave (['D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\Stresses\Pmax\Pmax',num2str(z),'.mat'],Pmax);
    %parsave (['D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\Stresses\Pmin\Pmin',num2str(z),'.mat'],Pmin);
    parsave (['D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\Tractions\TX\TX',num2str(z),'.mat'],Pmax);%........Tractions
    parsave (['D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\Tractions\TY\TY',num2str(z),'.mat'],Pmin);%........Tractions
    parsave (['D:\vignesh\Data_Analysis\Miku Data\Phase Images\Training Tables Database\Tractions\RMS\TRMS',num2str(z),'.mat'],Prms);%........Tractions
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmax',num2str(z),'.xlsx'],Pmax);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmin',num2str(z),'.xlsx'],Pmin);
    %increment(z);
end