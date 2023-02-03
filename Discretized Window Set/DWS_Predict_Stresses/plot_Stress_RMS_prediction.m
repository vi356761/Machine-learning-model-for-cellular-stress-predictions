function plot_Stress_RMS_prediction(Settings,Tract,Pmax,Pmin,TRMS,DIR,iteration)
 cd([DIR,'\Predictions'])
        if exist('Results') ~= 7
            mkdir('Results');
        end
 D = [DIR,'\Predictions\Results'];
 Save_Pmax = ([D,'\AVG_NORMAL_Stress',num2str(iteration),'.jpg']);
 Save_Pmin = ([D,'\Max_Shear_Stress',num2str(iteration),'.jpg']); 
 savefile_RMS =([D,'\RMS_Trac_finite',num2str(iteration),'.jpg']);
 AvgplotVar_onTracGrid =[Pmax Pmin];
 Trac_avg = xlsread(Tract);
  %% PLOT RMS TRACTIONS
        x = reshape(Trac_avg(:,1),sqrt(size(Trac_avg(:,1),1)),sqrt(size(Trac_avg(:,1),1)));
        y = reshape(Trac_avg(:,2),sqrt(size(Trac_avg(:,2),1)),sqrt(size(Trac_avg(:,2),1)));
        %Trac = readmatrix('D:\vignesh\Modified Code\code\2020-01-10\Scene8\Thresh\Predictions\Average Tables\MAT\LSVM\RMS_Predicted_LSVM_Fixed.xlsx'); 
        Trac = TRMS;
        Trac = reshape(Trac(:,1),sqrt(size(Trac(:,1),1)),sqrt(size(Trac_avg(:,2),1)));
        Trac = imresize(Trac, size(Trac)*2,'bicubic');
        x=imresize(x, size(x)*2,'bicubic');
        y=imresize(y, size(y)*2,'bicubic'); 
     %% RMS Plot
        figh3=figure;  set(figh3,'name','Tractions')       
        h=pcolor(x,y,Trac);
        set(gca,'YDir','reverse');  
        %hold on
        %quiver(x,y,TracX,TracY,15,'color','r')        
        colormap jet; shading flat; axis off; set(gca,'CLim',[0 Settings.trac_max]); colorbar; hold on;
        saveas(gcf,savefile_RMS);
 %% STRESS WITHOUT NODES
avg_norm = (AvgplotVar_onTracGrid(:,1) + AvgplotVar_onTracGrid(:,2))/2;
max_shear = (AvgplotVar_onTracGrid(:,1) - AvgplotVar_onTracGrid(:,2))/2;
node_x = reshape(Trac_avg(:,1),246,246); %Settings.domSize(2),Settings.domSize(1));
node_y = reshape(Trac_avg(:,2), 246, 246); %Settings.domSize(2),Settings.domSize(1));
stress_norm = reshape(avg_norm, 246, 246); %Settings.domSize(2),Settings.domSize(1)); avg norm stress
stress_shear = reshape(max_shear, 246, 246); %Settings.domSize(2),Settings.domSize(1));%max shear
%% Reshape Matrix
            stress_norm = imresize(stress_norm, size(stress_norm)*2,'bicubic');
            stress_shear = imresize(stress_shear, size(stress_shear)*2,'bicubic');
            node_x=imresize(node_x, size(node_x)*2,'bicubic');
            node_y=imresize(node_y, size(node_y)*2,'bicubic');  
%%            
%plot avg normal stress 
figure(1); 
   %rect = [100, 100, 800, 700]; 
   %set(gcf,'Position',rect,'Renderer','zbuffer'); clf; hold on;
   surface(node_x,node_y,stress_norm, 'edgecolor','none'); 
   view(2); colormap jet; shading flat;
   %view([-45 45]); colormap jet; shading interp; %for 3d viewing use this
   %line,also adimuth and elevation need to be changed, axis turned to
   %"off", and axis limits need to be commented out otherwise will not work
   cbh = colorbar; set(cbh,'FontSize',18,'FontWeight','bold');
   set(gca,'clim',[Settings.avg_norm_min Settings.avg_norm_max])
   %axis off
   %m1 = max2(TR);
   %h = quiver3(X,YY,2*m1*ones(size(X)),UX_dr,-UY_dr,zeros(size(X)),2);
   %set(h,'Color','w','LineWidth',1);
   axis equal; axis tight; axis ij; axis off
%  axis([-30 30 -30 30]);    
   axis([min(min(node_x)) max(max(node_x)) min(min(node_y)) max(max(node_y))]) 
%   xlabel('x (\mum)','FontSize',18,'FontWeight','bold'); ylabel('y (\mum)','FontSize',18,'FontWeight','bold');
   set(gca,'FontSize',18,'FontWeight','bold'); box on;
   title(' Average Normal Stress (Pa)','FontSize',18,'FontWeight','bold');
   %h2 = ellipse(abs(st_max)/m4, abs(st_min)/m4, StrsAng, node_x, node_y);hold on
   %h = quiver3(x,y,m1*ones(size(x)),ux_cell/m2,uy_cell/m2,zeros(size(x)),0);
   %set(h,'Color','k','LineWidth',0.5);
   %set(h2,'Color','k','LineWidth',.9); hold on;
   saveas(gcf,Save_Pmax);
    
 %plot maximum shear intercellular stress
  figure(2); 
   %rect = [100, 100, 800, 700]; 
   %set(gcf,'Position',rect,'Renderer','zbuffer'); clf; hold on;
   surf(node_x,node_y,stress_shear, 'edgecolor','none'); 
   view(2); colormap jet; shading flat; 
   cbh = colorbar; set(cbh,'FontSize',18,'FontWeight','bold');
   set(gca,'clim',[0 Settings.max_shear_max])
   %m1 = max2(TR);
   %h = quiver(X,YY,2*m1*ones(size(X)),UX_dr,-UY_dr,zeros(size(X)),2);
   %set(h,'Color','w','LineWidth',1);
   axis equal; axis tight; axis ij; axis off
%  axis([-30 30 -30 30]);    
   axis([min(min(node_x)) max(max(node_x)) min(min(node_y)) max(max(node_y))]) 
%   xlabel('x (\mum)','FontSize',18,'FontWeight','bold'); ylabel('y (\mum)','FontSize',18,'FontWeight','bold');
   set(gca,'FontSize',18,'FontWeight','bold'); box on;
   title('Maximum Shear Stress (Pa)','FontSize',18,'FontWeight','bold'); 
   saveas(gcf,Save_Pmin);
   close all;
end