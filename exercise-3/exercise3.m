%task1: seperate different regions with different colors,enumerates regions in the image
%{
f = imread('blobs.png');
bw = im2bw(f); % converts image to binary image

[L,num] = bwlabel(bw,8); % labels 8-connected regions found in the image
fprintf('%d', num) %number of connected regions

figure
imshowpair(bw,L,"montage") %shows binary image and labeled image at the same time

figure
imshow(label2rgb(L)) % visualize different regions with different colors

regions = regionprops(bw); % computes properties of regions in image, 
                     % outputs area, centroids and bounding box as default

% for loop starting from i=2, because the first region is the background of the image
for i =2:5 
    text(regions(i).Centroid(1), regions(i).Centroid(2), num2str(i-1));
    %enumerates regions in the image
    %on Centroid: the center of mass of the region
end
%}


%task2: remove regions that touch the borders, calculate the area
%{
f = imread('segmented_rice.png');

bw = im2bw(f);

cleared = imclearborder(bw); % remove objects or regions that touch the borders of an image
imshowpair(bw,cleared,"montage")

areas = regionprops(cleared, "Area"); % calculate the area of each connected component 
figure
histogram([areas.Area],20); % histogram of the areas, divides the data range into 20 intervals 
%}


%task3: apply threshold to an image, compare with im2bw function
%{
img = imread('noisy_fingerprint.tif');
imhist(img) 

threshold = 110;
thImg = (image > threshold);
bw = im2bw(img);

figure
subplot(131); imshow(img); title('Source image');
subplot(132); imshow(thImg); title('Visual inspection');
subplot(133); imshow(bw); title('im2bw');
%}

