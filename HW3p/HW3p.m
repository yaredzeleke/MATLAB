%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       Bayesian Data Analysis
%                       and Signal Processing
%
%                    A PHY 451/551 and I CSI 451/551
%                             FALL 2011
%
%                     Instructor: Kevin H. Knuth
%
%
% HW 3p
% Introduction to Global Warming Data
%
% The purpose of this homework set is to introduce you to data analysis in
% Matlab.  This importing data into Matlab and performing basic manipulations.
%
% We will perform some *crude* analyses of atmospheric CO2 data.
%
% TURN IN:
% Zip file containing:
%    1. this M-file with your code inserted
%    2. The MAT-files containing the data as instructed below
%    3. A report summarizing your work, illustrating your results (figures) and discussing your answers to the questions posed below.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Problem by: Kevin H. Knuth
% Created on: 8 August 2006
% Modified on: 22 Sept 2011
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Download (or unzip) the Vostok Ice Core Sample Data Set
% Import them into Matlab using the Import Data function in the File Menu
% Restructure the data into two arrays:
% vyear <1x363>   - years BP (before present, which was 2003)
% vco2  <1x363>   - co2 concentration in ppm
% V               - number of measurements
% save the results in a mat-file
%
% These data are provided courtesy of:
% Historical carbon dioxide record from the Vostok ice core
% J.-M. Barnola, D. Raynaud, C. Lorius
% Laboratoire de Glaciologie et de Géophysique de l'Environnement, CNRS,
% BP96, 38402 Saint Martin d'Heres Cedex, France 
% and
% N.I. Barkov
% Arctic and Antarctic Research Institute, Beringa Street 38, 199397, St.
% Petersburg, Russia

%clears console for interpretation
clc

%imports the formated data
load('vostok_data.mat','vco2','vyear', 'V')

% display vars to ensure correct data
%vco2
%vyear
%V

% initialize V to 0 to ensure accurate count of measurments 
V = 0; 

% Transposes the matrices if they are not row vectors(1x363)
if(isrow(vco2) ~= true)
    vco2 = vco2';
end
if(isrow(vyear) ~= true)
    vyear = vyear';
end

% iterates through data
for i = 1:length(vco2)
    
    % counts the number of measurments(entries) so long as they are
    % actually numbers(valid entries for our purpose)
  if(~isnan(vco2(i)))
      V = V + 1;
  end
end

% Saves data in required vars
save('vostok_data.mat','vco2','vyear', 'V')

% Plot the CO2 levels over time:
figure;
plot(vyear, vco2)

% Reverse the x-axis since data is from 4xx,xxx years before
% present(relatively speaking)
set(gca, 'XDir', 'reverse')

% removes scientific notation from years if uncommented
%set(gca, 'XTickLabel', num2str(get(gca,'XTick')','%d'))

title ('CO2 levels over time(Before Present)');
ylabel ('CO2 concentration (ppmv)');
xlabel ('Years Before Present');
% END Plot

% What is the range of variability of the CO2 levels?
fprintf('Range of variability of C02 levels: \nMin: %f \nMax: %f\n', min(vco2), max(vco2));

% Compute the mean and standard deviation of the CO2 levels?
fprintf('Mean of C02 levels: %f.\n', mean(vco2));
fprintf('Standard deviation of CO2 levels: %f.\n', std(vco2));

% Plot a histogram of the CO2 levels
figure;
hist(vco2)
title ('Histogram of CO2 levels over time(Before Present)');
ylabel ('Frequency');
xlabel ('CO2 concentration (ppmv)');

% QUESTIONS TO DISCUSS IN YOUR REPORT
% What is the range of variability of the CO2 levels?
% Compute the mean and standard deviation of the CO2 levels?
% Plot a histogram of the CO2 levels?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Download (or unzip) the Mauna Loa Atmopheric Sample Data Set
% Import them into Matlab using the Import Data function in the File Menu
% Restructure the data and save them in these arrays:
% myear  <1x557>   - year
% mmonth <1x557>   - month
% mtime  <1x557>   - time in years
% mco2   <1x557>   - co2 concentration in ppm
% M                - number of measurements
% save the results in a mat-file
% WARNING: THERE ARE MISSING DATA VALUES THAT YOU MUST DEAL WITH.
% Dont interpolate them, just omit them from the data array.
%
% These data are provided courtesy of:
% Atmospheric carbon dioxide record from Mauna Loa
% C.D. Keeling and T.P. Whorf
% Carbon Dioxide Research Group, Scripps Institution of Oceanography,
% University of California, La Jolla, California 92093-0444, U.S.A.


%'YOUR CODE GOES HERE'

load('maunaloa_data.mat','maunaloaCO2', 'myear','mmonth', 'mco2', 'mtime', 'M')

% initialize M to 0 to ensure accurate count of measurments 
M = 0;

k=0;
for i = 1:size(maunaloaCO2,1)                       % Loop over the rows of the matrix.
    for j = 2:size(maunaloaCO2,2)-2                 % Loop over the columns of the matrix.
        if maunaloaCO2(i,j)>0  
            k = k + 1;                              % The data must be a valid measurement
            myear(k) = maunaloaCO2(i,1);            % Fill the "myear" array
            
        end
    end
 
end

k=0;
for i = 1:size(maunaloaCO2,1)                       % Loop over the rows of the matrix.
    for j = 2:size(maunaloaCO2,2)-2                 % Loop over the columns of the matrix.
        if maunaloaCO2(i,j)>0  
            k = k + 1;                              % The data must be a valid measurement
            mmonth(k) = j-1;                        % Fill the "mmonth" array
            
        end
    end
 
end


k=0;
for i = 1:size(maunaloaCO2,1)                       % Loop over the rows of the matrix.
    for j = 2:size(maunaloaCO2,2)-2                 % Loop over the columns of the matrix.
        if maunaloaCO2(i,j)>0  
            k = k + 1;                              % The data must be a valid measurement
            mco2(k) = maunaloaCO2(i,j);             % Fill the "mco2" array
            
        end
    end
 
end


k=0;
for i = 1:size(maunaloaCO2,1)                               % Loop over the rows of the matrix.
    for j = 2:size(maunaloaCO2,2)-2                         % Loop over the columns of the matrix.
        if maunaloaCO2(i,j)>0  
            k = k + 1;                                      % The data must be a valid measurement
            mtime(k) =(maunaloaCO2(i,1) + ((j-1)/12));   % Fill the "time" array
            
        end
    end
 
end

%uncomment to view data
%myear
%mmonth
%mco2
%mtime

M = k;

% Saves data in required vars
save('maunaloa_data.mat','maunaloaCO2', 'myear','mmonth', 'mco2', 'mtime', 'M')

% Plot the CO2 levels over modern times
figure;
plot(mtime, mco2)

title ('CO2 levels over Modern Times');
ylabel ('CO2 concentration (ppmv)');
xlabel ('Years');

% END Plot the CO2 levels over modern times

% QUESTIONS TO DISCUSS IN YOUR REPORT
% -Plot the CO2 levels over modern times
% -Can you determine (roughly) the period of the oscillations?
%   - Appears to happen once a year with the peak occurring towards the middle of the
%       year
% -What could cause this? 
%   - possibly higher gas consumption during the
%   nicer parts of the year


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Combine the two data sets by concatenating the arrays
% time  <1x920>   - time in years
% co2   <1x920>   - co2 concentration in ppm
% S = V + M       - number of measurements
% Remember that the Vostok data is in years before present, while the Mauna
% Loa data are real dates.

% initialize S to 0 to ensure accurate count of measurments
S = 0;

time = horzcat(myear,vyear);
co2 = horzcat(mco2, vco2);

S = V + M;

% Plot the CO2 levels over time
figure;
plot(time, co2)

% Reverse the x-axis since data is from 4xx,xxx years before
% present(relatively speaking)
set(gca, 'XDir', 'reverse')

% removes scientific notation from years if uncommented
%set(gca, 'XTickLabel', num2str(get(gca,'XTick')','%d'))

title ('CO2 levels over time(Before 2005)');
ylabel ('CO2 concentration (ppmv)');
xlabel ('Years Before 2005');
% END Plot

% QUESTIONS TO DISCUSS IN YOUR REPORT
% - What is the CO2 level in May 1986?
    %350.23
% - Given the calculated one standard deviation calculated using the Vostok ice core sample,
%   is it likely that this modern spike is just one of many natural fluctuations?
% - Can you estimate the probability that this modern spike is a natural fluctuation? (extra credit)
% - What is compelling about this analysis?
% - Why is this analysis insufficient?
