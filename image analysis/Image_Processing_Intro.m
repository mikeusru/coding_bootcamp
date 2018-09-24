%% Read In Image, Prepare It
% figure out what each line does...
I = imread('tissue.png');
% I = I(125+(1:256),1:256,:);
f1 = figure;
imshow(I);
figure(f1);
title('Original Image');
text(size(I,2),size(I,1)+15, ...
    'Image courtesy of Alan Partin, Johns Hopkins University', ...
    'FontSize',7,'HorizontalAlignment','right');

%% Explore image using imtool
imtool(I)

%% What if we sum all the channels together?
I_sum = sum(I,3);
figure; imshow(I_sum)
%% Values are outside of normal image range...
% need to show image using vaalue scaling
figure; imagesc(I_sum)
%% Display each channel side by side
subplot(1,4,1), imshow(I)
subplot(1,4,2), imshow(I(:,:,1))
subplot(1,4,3), imshow(I(:,:,2))
subplot(1,4,4), imshow(I(:,:,3))
%%
BW = imbinarize(I(:,:,3));
figure; imshow(BW);
%%
BW_ao = bwareaopen(~BW,1000);
figure; imshow(BW_ao);
%% Region Analysis
stats = regionprops(BW_ao,'Area','Centroid');
perimeter = bwperim(BW_ao);
figure; imshow(perimeter);
I_perim = imoverlay(I,perimeter,'k');
figure,imshow(I_perim);

for i = 1:length(stats)
    x = stats(i).Centroid(1);
    y = stats(i).Centroid(2);
    area_string = ['Area = ', num2str(stats(i).Area)];
    text(x,y,area_string,'FontSize',20,'FontWeight','bold','color','k');
end