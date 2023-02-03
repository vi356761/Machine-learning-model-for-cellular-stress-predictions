function [h4,h5,h6]= PLotStressRMSChange(h1,h2,h3,Normal,Shear,RMS,DIR,iteration,N)

% First save the time series images from plotstressRMS function
D = [DIR,'\Predictions\Results'];
saveas(h1,[D,'\Average_Normal_Stress_Series.jpg']);
saveas(h2,[D,'\Maximum_Shear_Stress_Series.jpg']);
saveas(h3,[D,'\RMS_Traction_Series.jpg']);

% Prepare the data for plotting change for every 5 minutes
xx =iteration-1;
x2 = 5:5:(xx*5);
%x2 = round(linspace(5,360,72));
y1 = Normal;
y2 = Shear;
y3 = RMS;
z1 = zeros(N-1,1);
z2 = zeros(N-1,1);
z3 = zeros(N-1,1);
for j = 1:N-1
    z1(j,1) = y1(j+1,1)-y1(j,1);
    z2(j,1) = y2(j+1,1)-y2(j,1);
    z3(j,1) = y3(j+1,1)-y3(j,1);
end
Z1 = z1.';
Z2 = z2.';
Z3 = z3.';

% Actual plot code
%% Average Normal Stress:
h4 = figure;
title('Change in Average Normal Vs Time','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
plot(x2,Z1,'r','MarkerSize',10)
xlabel('Time (min)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
ylabel ('Change in Average Normal Stress (Pa)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
%ax1=gca;
%k = [0, 0, 0];
%ax1.YColor = k;
ylim([-2 2])
yticks([-2 0 2])
%legend('Max_Shear_Predicted')
ax2 = gca;
ax2.FontWeight = 'bold';
ax2.XAxis.FontSize = 12;
ax2.YAxis.FontSize = 12;
%ax2.YColor = k;%
%ax2.YAxis(2).FontSize = 12;
%ax2.YColor(2) = k;
set(ax2,'TickLength',[0 0])
set(ax2,'LineWidth',2)
%ax.BoxStyle = 'full';
set(ax2, 'FontName', 'Arial')
box on;
%set(ax2,'YColor',color,'TickDir','out')
%set(ax2,'Visible','off')
% legend('show');
% legend([ax1(1);ax2(1)],{'Max_Shear Exp','Max_Shear_Predicted'});
hold off;
%% Maximum Shear stress:
h5 = figure;
title('Change in Maximum Shear Vs Time','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
plot(x2,Z2,'k','MarkerSize',10)
xlabel('Time (min)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
ylabel ('Change in Maximum Shear Stress (Pa)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
%ax1=gca;
%k = [0, 0, 0];
%ax1.YColor = k;
ylim([-2 2])
yticks([-2 0 2])
%legend('Max_Shear_Predicted')
ax2 = gca;
ax2.FontWeight = 'bold';
ax2.XAxis.FontSize = 12;
ax2.YAxis.FontSize = 12;
%ax2.YColor = k;%
%ax2.YAxis(2).FontSize = 12;
%ax2.YColor(2) = k;
set(ax2,'TickLength',[0 0])
set(ax2,'LineWidth',2)
%ax.BoxStyle = 'full';
set(ax2, 'FontName', 'Arial')
box on;
%set(ax2,'YColor',color,'TickDir','out')
%set(ax2,'Visible','off')
% legend('show');
% legend([ax1(1);ax2(1)],{'Max_Shear Exp','Max_Shear_Predicted'});
hold off;
%% RMS Traction
h6 = figure;
title('Change in RMS Traction Vs Time','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
plot(x2,Z3,'-b','MarkerSize',10)
xlabel('Time (min)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
ylabel ('Change in RMS Traction (Pa)','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
%ax1=gca;
%k = [0, 0, 0];
%ax1.YColor = k;
ylim([-2 2])
yticks([-2 0 2])
%legend('Max_Shear_Predicted')
ax2 = gca;
ax2.FontWeight = 'bold';
ax2.XAxis.FontSize = 12;
ax2.YAxis.FontSize = 12;
%ax2.YColor = k;%
%ax2.YAxis(2).FontSize = 12;
%ax2.YColor(2) = k;
set(ax2,'TickLength',[0 0])
set(ax2,'LineWidth',2)
%ax.BoxStyle = 'full';
set(ax2, 'FontName', 'Arial')
box on;
%set(ax2,'YColor',color,'TickDir','out')
%set(ax2,'Visible','off')
% legend('show');
% legend([ax1(1);ax2(1)],{'Max_Shear Exp','Max_Shear_Predicted'});
hold off;
%% Save images
saveas(h4,[D,'\Average_Normal_Stress_Change.jpg']);
saveas(h5,[D,'\Maximum_Shear_Stress_Change.jpg']);
saveas(h6,[D,'\RMS_Traction_Change.jpg']);
end