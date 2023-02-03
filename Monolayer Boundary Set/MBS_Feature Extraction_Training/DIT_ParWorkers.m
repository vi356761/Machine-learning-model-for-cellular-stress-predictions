%parpool(4);%60516
 for z = 1:4 %60516
 P = zeros(333, 3);
 D = zeros(333, 3);
 P1 = zeros(333, 1);
 P2 = zeros(333, 1);
 %R = zeros(1,3);
 
 spmd
  if labindex == 1
    cd('C:\Vignesh\OneDrive_2019-06-26\to give vignesh\0.2ug_mL chalcone 1');
    load ('NewStresses.mat');
    %R1 = importdata('stat1.xlsx');
    %R = R1.data.Sheet1;
    R = xlsread('stat1.xlsx');
    for j = 1:73
        Data = Stresses{1,j};
        D(j,1:7) = Data(z,:); %Loop Data to train other data points...from 1 to 60516!
        P1 (j,1) = D(j,4);
        P2 (j,1) = D(j,5);
        P(j,:)= R;
    end
    
  elseif labindex == 2  
    cd('C:\Vignesh\OneDrive_2019-06-26\to give vignesh\0.2ug_mL chalcone 2');
    load ('NewStresses.mat');
    %R1 = importdata('stat2.xlsx');
    %R = R1.data.Sheet1;
    R = xlsread('stat2.xlsx');
    for j = 1:102
        k = 73+j;
        Data = Stresses{1,j};
        D(k,1:7) = Data(z,:);
        P1 (k,1) = D(k,4);
        P2 (k,1) = D(k,5);
        P(k,:)= R;
     end
elseif labindex == 3
 cd('C:\Vignesh\OneDrive_2019-06-26\to give vignesh\2ug_mL chalcone 1');
 %R1 = importdata('stat_1.xlsx');
 %R = R1.data.Sheet1;
 R = xlsread('stat_1.xlsx');
 load ('NewStresses.mat');
    for j = 1:79
        k = 175+j;
        Data = Stresses{1,j};
        D(k,1:7) = Data(z,:);
        P1 (k,1) = D(k,4);
        P2 (k,1) = D(k,5);
        P(k,:)= R;
        
    end
   elseif labindex == 4 
        cd('C:\Vignesh\OneDrive_2019-06-26\to give vignesh\2ug_mL chalcone 3');
        load ('NewStresses.mat');
        %R1 = importdata('stat_3.xlsx');
        %R = R1.data.Sheet1;
        R = xlsread('stat_3.xlsx');
    for j = 1:79
        k = 254+j;
        Data = Stresses{1,j};
        D(k,1:7) = Data(z,:);
        P1 (k,1) = D(k,4);
        P2 (k,1) = D(k,5);
        P(k,:)= R;  
    end
  end
 end
    Pmax = [P,P1];
    Pmin = [P,P2];
    Pmax = array2table(Pmax,'VariableNames',{'Area','Perimeter','Chalcone','Pmax'});
    Pmin = array2table(Pmin,'VariableNames',{'Area','Perimeter','Chalcone','Pmin'});
    cd('C:\Vignesh');
    save ('C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmax',Pmax)
    save ('C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmin',Pmin);
    %parsave (['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmax\Pmax',num2str(z),'.mat'],Pmax);
    %parsave (['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmin\Pmin',num2str(z),'.mat'],Pmin);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmax',num2str(z),'.xlsx'],Pmax);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmin',num2str(z),'.xlsx'],Pmin);
    z = z+1;
end