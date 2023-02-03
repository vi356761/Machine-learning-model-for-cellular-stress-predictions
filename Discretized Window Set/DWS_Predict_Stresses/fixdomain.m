function [P1,P2,RMS_Trac] = fixdomain(yfit_Pmax,yfit_Pmin,yfit_RMS,R,DIR)
Dom = readmatrix ([DIR,'\domain.dat']);
Domain = Dom(:,4);
P1 = yfit_Pmax; P2 = yfit_Pmin; RMS_Trac = yfit_RMS;
for i = 1:R
 
 if Domain(i,1) == 0
    P1(i,1) = 0;
    P2(i,1) = 0;
    RMS_Trac(i,1) = 0;
  end

end