parpool(4);%60516
x=load ('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\NewStresses.mat');
R = xlsread('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 1\stat1.xlsx');
AA= load ('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 2\NewStresses.mat');
A = xlsread('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\0.2ug_mL chalcone 2\stat2.xlsx');
B = xlsread('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\2ug_mL chalcone 1\stat_1.xlsx');
BB= load ('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\2ug_mL chalcone 1\NewStresses.mat');
CC= load ('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\2ug_mL chalcone 3\NewStresses.mat');
C = xlsread('D:\vignesh\Data_Analysis\Miku Data\to give vignesh\2ug_mL chalcone 3\stat_3.xlsx');
parfor z = 1:60516
 P = zeros(292, 3);  %P = zeros(333, 3);
 D = zeros(292, 3);  %D = zeros(333, 3);
 P1 = zeros(292, 1); %P1 = zeros(333, 1);
 P2 = zeros(292, 1); %P2 = zeros(333, 1);
 r =R;
 a=A;
 b=B;
 c=C;
 xx=x;
 AAA=AA;
 BBB=BB;
 CCC=CC;
 %R = zeros(1,3);
 
    for j = 1:73
        Data = xx.Stresses{1,j};
        D(j,1:7) = Data(z,:); %Loop Data to train other data points...from 1 to 60516!
        P1 (j,1) = D(j,4);
        P2 (j,1) = D(j,5);
        P(j,:)= r;
    end
    
    for l = 1:73
        m = 73+l;
        Data = AAA.Stresses{1,l};
        D(m,1:7) = Data(z,:);
        P1 (m,1) = D(m,4);
        P2 (m,1) = D(m,5);
        P(m,:)= a;
     end

    for n = 1:73
        o = 146+n;
        Data = BBB.Stresses{1,n};
        D(o,1:7) = Data(z,:);
        P1 (o,1) = D(o,4);
        P2 (o,1) = D(o,5);
        P(o,:)= b;
        
    end

    for u = 1:73
        v = 219+u;
        Data = CCC.Stresses{1,u};
        D(v,1:7) = Data(z,:);
        P1 (v,1) = D(v,4);
        P2 (v,1) = D(v,5);
        P(v,:)= c;  
    end
    Pmax = [P,P1];
    Pmin = [P,P2];
    Pmax = array2table(Pmax,'VariableNames',{'Area','Perimeter','Chalcone','Pmax'});
    Pmin = array2table(Pmin,'VariableNames',{'Area','Perimeter','Chalcone','Pmin'});
    cd('D:\vignesh\Table Generating Codes');
    parsave (['D:\vignesh\Data_Analysis\Tables\Table_73_Cell_Arrays\Pmax\Pmax',num2str(z),'.mat'],Pmax);
    parsave (['D:\vignesh\Data_Analysis\Tables\Table_73_Cell_Arrays\Pmin\Pmin',num2str(z),'.mat'],Pmin);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmax',num2str(z),'.xlsx'],Pmax);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmin',num2str(z),'.xlsx'],Pmin);
    %increment(z);
end