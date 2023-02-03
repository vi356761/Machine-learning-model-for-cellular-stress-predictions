%% Master code to automate intercellular stresses and RMS predictions
% Vignesh 5/29/2020
%% Settings to check/change before running:
% 1) Change the paths of 'QSVM', 'LSVM', 'STEP'(1,2,&3) if the trained models are saved to a different folder or a computer
% 2) Change the variable 'Phase' depending on the naming scheme the microscope uses
% 3) Change the number of images 'N' depending on the number of images that is anticipated to be taken by the microscope
% 4) The code is set up for crop size 2000*2000 pixels. Change i1,i2,j1,j2 if necessary
% 5) Change blocksize, padding, overlap depending on the spatial resolution you need
% 6i) According to the blocksize window parameters, the values of nXPts are calculated. 
% 6ii) Use different nXPts formula for crop size othe than 2000*2000; make relevant changes in the window function too
% 7) Choose the chalcone concentration value 'C' (range 0-2)
% 8) Choose the settings for maximum and minimum stress,Traction values for plots
% 9i) Choose the 'Tract' which gives the path to excel file that has disp/traction coordinates
% 9ii) If the coordinate file is not found for other crop sizes check the disp blocks to see how to get the coordinates for various bloacksize,padding, image size and save it as an excel file
%% How to run?
% Step1: Check yor global settings (everything above the for loop).
% Go through 'Settings to check/change before running:' to make sure the code is on right settings

% Step2: Press 'F5' or click on the Run button in the Matlab Editor

% Step3: The code will prompt to selct the folder where you save the predictions and other relevant files

% Step4: The code will prompt to trace the domain of the 1st image. Trace it manually using cursor

% Step5: Sit back as the code finishes the analyzes for each image as it is taken in sequence

% Note: It takes approximately 10.5 minutes to complete 1 image if QSVM is used 
% It should take less than 10 minutes for LSVM and SR predictive models
% Use pause() command at the end of the loop if images are taken at an interval greater than 10 minutes

%% Read before running the code
% The code predicts the intercellular stresses and Tractions (Maximum,Minimum Principal Stresses & RMS Tractions)
% Just selct the 'master directory' (stored as DIR in the code) where all the predictions with pertaining files are stored 
% The predictions are made based on fit from Support Vector Machine or Stepwise Linear Regression
% The predictions are true only for HUVECs with passage numbers 8-9
% The models are trained using circular constrained monolayers ~2mm 
% Predictions should be accurate enough even for monolayers of other diameter as long as the geometry is circular enough
%% Choose your model
% Input one of the three models in the predict function
% The below paths are the repository where all the trained data are stored
% These models were built after several hours of training (~5 hours) from 4 samples with 292 images (2 samples 2ug/ml & 2 samples 0.2ug/ml)
%% Note for MAT method trained models
% 1) All the trained models are saved with the same name starting 'Trained_Model'
% 2) All Pmax when loaded are saved to workspace as trainedModel.mat
% 3) All Pmin when loaded are saved to workspace as trainedModel1.mat
% 4) Trained models for RMS Tractions:
%    i) LSVM & SR models when loaded are saved to workspace as ii.mat
%    ii) QSVM Model when loaded is saved as trainedModel.mat
%%
%QSVM
% The paths of trained models were stored for Pmax, Pmin and RMS Predictors
QSVM1 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Stresses\Pmax\QSVM\');
QSVM2 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Stresses\Pmin\QSVM\');
QSVM3 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Tractions\RMS\QSVM\');
%LSVM
LSVM1 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Stresses\Pmax\LSVM\');
LSVM2 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Stresses\Pmin\LSVM\');
LSVM3 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Tractions\RMS\LSVM\');
%STEP
STEP1 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Stresses\Pmax\SR\');
STEP2 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Stresses\Pmin\SR\');
STEP3 = ('D:\vignesh\Data_Analysis\Miku Data\Phase Images\Trained Model Database\Tractions\RMS\SR\');
%% Image segmentation Global parameters
% Select the folder where the phase image is going to be stored as experiment progresses
% DIR is the master directory where all the pre-processing, post-processing files, analyses and predictions are stored 

DIR = uigetdir('Select the directory to store the results'); % Select the master directory where the first phase image is stored
Phase = ('phase'); % Enter the naming scheme for phase images
N = 73;  % Enter the anticipated number of images
% Stores the pathname and file to read the image for pre-processing 
[file, pathname] = uigetfile({'*.jpg';'*.tif'},'Select the first phase image'); 
I = imread([pathname,file]); % Select the first phase image
% Select the parameters for cropping the image
% The code is set for cropping size 2000*2000
% Note in image and figure plots the columns come first from top to bottom & the rows come second move from left to right
% In matrix row comes first (height) followed by column (width)
i1=20; % Starting height pixel top most edge(1,20)
i2=2019; % End portion of crop height bottom most edge(1,2019)
j1=20; % Starting width pixel left most edge(20,1)
j2=2019; % End width of the crop right most edge(2019,1)
%j is width. i is height
Im = I(i1:i2,j1:j2); % Image is cropped to the set parameters
% Now store the domain image 
imshow(Im);
hFH = roipoly(); % Mannually trace the boundary of constrained monolayer and apply it to future images taken by the microscope
BW =logical(hFH); % Convert the domain to logical (0s and 1s) 
%T = 0.68; %Select threshold value for the binary image
close;
%% Calculating Area wise winodw global parameters
% select the padding, window size and overlap according to your image size
% & Spatial resolution you need
% The settings below are set-up for 2000*2000 image prediction with a resolution of 246*246 
padding = 32; % Extra width added to the cropped window when calculating pixel shift
overlap = 0.75; % How much the is the next window shifted to calculate the pixel shift
blocksize = 32; % Choose your window size 
inc = round(blocksize*(1-overlap));
nXPts = ((size(Im,1)-blocksize+1)-1)/inc; % Use for 2000*2000
%nXPts = (((size(Im,1)-blocksize+1)-1)/inc)+1; % Use for other crop sizes
%nXPts = 246; %Change this according to your image size and spatial resolution

% reshape the domain image into a column matrix (single column multiple rows)
BW01 = reshape(imresize(BW,[nXPts nXPts])*1,nXPts*nXPts,1);
imwrite(Im,[pathname,'\Crop_PC_1.tif']); %Stores the cropped image
imwrite(hFH,[pathname,'\Domain.tif']); % Stores the domain image of the phase
save([DIR,'\domain.dat'],'BW01','-ASCII'); % Storing the reshaped matrix of the domain image
R = nXPts*nXPts; %Your spatial resolution 
%% Experimental parameters
%Choose chalcone concentration
C = 0; %Choose chalcone concentration
CC = zeros(R,1)+C; % Creates a matrix with set chalcone concentration and resolution
P1= NaN(R,1); % Creates an empty array with set resolution for predictions
Normal = zeros(N,1);%Arrays for time seies plots
Shear = zeros(N,1);
RMS = zeros(N,1);
% Settings structure is created to store the parameters for making stress traction plots
Settings.domSize = [nXPts,nXPts];
Settings.max_shear_max = 600;
Settings.avg_norm_min = 0;
Settings.avg_norm_max = 600;
Settings.PixelSize = 1.3;
Settings.trac_max = 50;
Settings.tracx_max = 30;

Settings.tracx_min = 0;
% Select the path where traction coordinates are stored as an excel file
% Can even get the coordinates if missing from the window function written below
% Also, refer 'disp blocks' function inside displacement finder to see how to get the traction/displacement coordinates
Tract = ('D:\vignesh\Data_Analysis\FEM_Prediction_Plot\Traction_coord.xlsx');%File that has traction coordinates
%% Start stress & traction prediction loop
% Run Segmenting Routine
for iteration =1:N
  
  % 1) Crop the phase images in loop
  [Im] = cropPC(Phase,pathname,i1,i2,j1,j2,iteration); 
  
  % 2) Segments the image when you input the image, folder path, number of images,image domain
  thresh = segment(Im,DIR,iteration,hFH);
  
  % 3) Calculates the window area and perimeter
  Z = window(thresh,padding,overlap,blocksize,DIR,iteration);
  
  % 4) Makes the prediction tables for feeding into the trained models
  T = PredictionTables(Z,CC,P1,iteration,DIR);
  
  % 5) Predicts the max/min principal stresses, rms tractions and stores in the master folder
  [yfit_Pmax,yfit_Pmin,yfit_RMS] = Predict(T,STEP1,STEP2,STEP3,R,iteration,DIR);
  
  % 6) Fixes the domain by using the domain.dat file created from the 1st image
  [P1,P2,RMS_Trac] = fixdomain(yfit_Pmax,yfit_Pmin,yfit_RMS,R,DIR);
  
  % 7) Filters the noise and replaces them with '0' Pa 
  % Note: Removing the noise by making them 0 didn't affect the average values of the stresses and tractions or the distribution
  [Pmax,Pmin,TRMS] = filternoise(P1,P2,RMS_Trac,iteration,DIR);
  
  % 8) Plots the filtered average normal, max shear stresses and RMS Tractions
  plot_Stress_RMS_prediction(Settings,Tract,Pmax,Pmin,TRMS,DIR,iteration);
  
  %9) Store the average Normal, Max Shear stresses, and RMS Tractions for the entire field of view for each time
  [Normal, Shear, RMS] = timeaverage(Pmax,Pmin,TRMS,Normal,Shear,RMS,iteration);
  
  %10)
  [h1,h2,h3]= PLotStressRMS(Normal, Shear, RMS);
  %pause(300) % pauses the code for 5 minutes
end
% Save the final results
[h4,h5,h6]= PLotStressRMSChange(h1,h2,h3,Normal,Shear, RMS,DIR,iteration,N);
  