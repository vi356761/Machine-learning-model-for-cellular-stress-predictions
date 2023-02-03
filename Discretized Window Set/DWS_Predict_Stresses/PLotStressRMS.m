function [h1,h2,h3]= PLotStressRMS(Normal, Shear, RMS)

x1 = round(linspace(0,360,73));
%x =iteration-1;
%x1 = 0:5:(x*5);
y1 = Normal;
y2 = Shear;
y3 = RMS;

h1 = figure;
title('Average Normal Stress Vs Time','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
plot(x1,y1,'.r','MarkerSize',10);
xlabel('Time (min)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
ylabel ('Average Normal Stress (Pa)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
drawnow();

h2 = figure;
title('Maximum Shear Stress Vs Time','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
plot(x1,y2,'.k','MarkerSize',10);
xlabel('Time (min)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
ylabel ('Maximum Shear Stress (Pa)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
drawnow();

h3 = figure;
title('RMS Traction Vs Time','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
plot(x1,y3,'.b','MarkerSize',10);
xlabel('Time (min)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
ylabel ('RMS Traction (Pa)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
drawnow();
end


