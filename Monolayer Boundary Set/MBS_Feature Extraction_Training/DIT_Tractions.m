parpool(4);%60516
A = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\0.2u\1\stat1.xlsx');
B = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\0.2u\2\stat2.xlsx');
C = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\2\1\stat_1.xlsx');
D = xlsread('D:\vignesh\Data_Analysis\Miku Data\tractions_new\2\3\stat_3.xlsx');
parfor z = 17401:21018
a = A;
b = B;
c = C;
d = D;
P = zeros(292, 3);  %P = zeros(333, 3);
E = zeros(292, 3);  %D = zeros(333, 3);
P1 = zeros(292, 1); %P1 = zeros(333, 1);
P2 = zeros(292, 1);
 
    for j = 1:73
        Data1 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\tractions_new\0.2u\1\Tractions\Time',num2str(j),'\traction.dat']);
        E(j,1:4) = Data1(z,:); %Loop Data to train other data points...from 1 to 60516!
        P1 (j,1) = E(j,3);
        P2 (j,1) = E(j,4);
        P(j,:)= a;
    end
    
    for l = 1:73
        m = 73+l;
        Data2 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\tractions_new\0.2u\2\Tractions\Time',num2str(l),'\traction.dat']);
        E(m,1:4) = Data2(z,:);
        P1 (m,1) = E(m,3);
        P2 (m,1) = E(m,4);
        P(m,:)= b;
     end

    for n = 1:73
        o = 146+n;
        Data1 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\tractions_new\2\1\Tractions\Time',num2str(n),'\traction.dat']);
        E(o,1:4) = Data1(z,:);
        P1 (o,1) = E(o,3);
        P2 (o,1) = E(o,4);
        P(o,:)= c;
        
    end

    for u = 1:73
        v = 219+u;
        Data2 = readmatrix(['D:\vignesh\Data_Analysis\Miku Data\tractions_new\2\3\Tractions\Time',num2str(u),'\traction.dat']);
        E(v,1:4) = Data2(z,:);
        P1 (v,1) = E(v,3);
        P2 (v,1) = E(v,4);
        P(v,:)= d;  
    end
    Pmax = [P,P1];
    Pmin = [P,P2];
    Pmax = array2table(Pmax,'VariableNames',{'Area','Perimeter','Chalcone','Pmax'});
    Pmin = array2table(Pmin,'VariableNames',{'Area','Perimeter','Chalcone','Pmin'});
    cd('D:\vignesh\Table Generating Codes');
    parsave (['D:\vignesh\Data_Analysis\Miku Data\Traction Tables\Pmax\Pmax',num2str(z),'.mat'],Pmax);
    parsave (['D:\vignesh\Data_Analysis\Miku Data\Traction Tables\Pmin\Pmin',num2str(z),'.mat'],Pmin);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmax',num2str(z),'.xlsx'],Pmax);
    %xlswrite(['C:\Vignesh\OneDrive_2019-06-26\to give vignesh\Tables\Pmin',num2str(z),'.xlsx'],Pmin);
    %increment(z);
end