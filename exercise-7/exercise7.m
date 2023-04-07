% Task 1: Determine the regions corresponding to weld failures with region growing.
%{
img = imread('defective_weld.tif');
%logical indexing. each pixel that has a value of 255 in the original image is
% assigned a value of 1 in the binary image, and all other pixels are 
% assigned a value of 0.
marker = (img==255); % seed points are determined
figure; imshowpair(img, marker, "montage")
title('Seed points (marker)')

imcontrast
threshold = 190; % threshold value chosen by analyzing the histogram of the original image 
mask = (img > threshold); % thresholded image
figure; imshow(mask)
title('Mask')

conImg = imreconstruct(marker, mask); % morphological reconstruction using seed points as marker
                                 % thresholded image as mask
figure;
subplot(231); imshow(img); title('original');
subplot(232); imshow(marker); title('seed points');
subplot(233); imhist(img); title('histogram of the original image');
subplot(234); imshow(mask); title('thresholded image');
subplot(235); imshow(conImg); title('result');
%}



% Task 2:Segmentation with texture filters. Segment the image into two regions based on the texture.
%{
img = imread('bag.png');

entImg = entropyfilt(img) ; %degree of randomness or complexity of the image
scaledEntImg = mat2gray(entImg); %rescale the pixel values to the range between 0 and 1
thImg = im2bw(scaledEntImg, 0.82); % thresholded image
bwImg = bwareaopen(thImg, 1350); % vertical spikes removed from up part of the image

se = strel('disk',7);
clImg = imclose(bwImg,se); % morphological closing using disk as structuring element
fillImg = imfill(clImg,'holes'); % few holes filled in bottom part of the image

fillImg = imdilate(fillImg,strel('disk',7)); % fill the borders by dilation and erosion
fillImg = imerode(fillImg,strel('disk',7));

figure;
subplot(231); imshow(img); title('original');
subplot(232); imshow(scaledEntImg); title('filtered and rescaled');
subplot(233); imshow(thImg); title('thresholded');
subplot(234); imshow(bwImg); title('bwareaopen');
subplot(235); imshow(clImg); title('imclose');
subplot(236); imshow(fillImg); title('imfill');
%}

% Task3 :  image segmentation with the created mask

img = imread('bag.png');

entImg = entropyfilt(img);
scEntImg = mat2gray(entImg);

thImg = im2bw(scEntImg,0.82);
bwImg = bwareaopen(thImg,1350);

se = strel('disk',7);
clImg = imclose(bwImg,se);
fillImg = imfill(clImg,'holes');

fillImg = imdilate(fillImg,strel('disk',7));
fillImg = imerode(fillImg,strel('disk',7));

se2 = strel('disk',1); 
morGrad = imdilate(fillImg,se2) - imerode(fillImg,se2); % line made by morphological gradient

figure; imshow(morGrad)
title("line made by morphological gradient")

im2 = img;    % copy of original image f
im2(fillImg) = 0; % bottom part of the image is set to zeros

im3 = img;     % copy of original image f
im3(~fillImg) = 0; % top part of the image is set to zeros

im4 = img;             % copy of original image f
im4(im2bw(morGrad)) = 255; % add segmentation line to the original image

figure;
subplot(221); imshow(img);   title('original');
subplot(222); imshow(im2); title('top part');
subplot(223); imshow(im3); title('bottom part');
subplot(224); imshow(im4); title('segmentation line');

