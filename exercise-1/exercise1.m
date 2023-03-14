%Task 1: read image, show image, adjust contrast
%{
f = imread('mammogram.tif');
imshow(f)

j = imadjust(f,[0.1 0.7]); %maps intensity values in I to new values in J such that values between low_in and high_in 
imshow(j)
%}


%Task 2: histogram equalization to enhance contrast, plot histogram
%{ 
clear all
close all

img = imread('pollen.tif');
img2 = histeq(img); % histogram equalization
%imshow(img2);

figure %creates a new figure window
subplot(221); imshow(img) % subplot can be used to plot several images in one figure
subplot(222); imshow(img2)
subplot(223); imhist(img) % displays histogram of the image
subplot(224); imhist(img2)
%}


%Task3: writing a function displaying both the original image and an enhanced image
%{
img = imread('pollen.tif');
img2 = histeq(img);

resultImg = myfunction(img,1,200,300,500); % function call
resultImg2 = myfunction(img2,1,200,300,500);

figure
subplot(221); imshow(resultImg)
subplot(222); imshow(resultImg2)
subplot(223); imshow(img)
subplot(224); imshow(img2)
%}

