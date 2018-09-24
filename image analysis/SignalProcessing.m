%% load data
load('signal_data.mat');
figure; plot(loaded_data);
title('Loaded Data');

%% standardize data
data = loaded_data - min(loaded_data);
data = data/max(data);

figure; plot(data);
title('Standardized Data');

%% Find Peaks
xpeaks = [];
ypeaks = [];
for x_i = 2:length(data)-1
    y_i = data(x_i);
    y_before_peak = data(x_i-1);
    y_after_peak = data(x_i+1);
    
    if y_i>y_before_peak && y_i>y_after_peak
        xpeaks(end+1) = x_i;
        ypeaks(end+1) = y_i;
    end
    
end
%% show peaks
figure; plot(data);
hold on
scatter(xpeaks,ypeaks);
title('Peaks');

%% Threshold peaks
low_peak_index = ypeaks < .8;
ypeaks(index) = [];
xpeaks(index) = [];

%% show new peaks
figure; plot(data);
hold on
scatter(xpeaks,ypeaks);
title('Thresholded Peaks');